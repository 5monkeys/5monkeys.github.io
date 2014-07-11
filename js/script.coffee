# En snel easing funktion :))
easeOutQuart = (d) -> (t) -> 1 - (t/d-1)*(t/d-1)*(t/d-1)*(t/d-1)
easing = easeOutQuart(1.8)

# measurements in pixels
depth = 1000
tiltWidth = 200
tiltHeight = 0  # not implemented properly

planes =
  contact:    {z:  +500, offset: -tiltWidth, align: 'left'}
  projects:   {z:  +500, offset: -tiltWidth, align: 'right'}
  content:    {z:     0},
  background: {z: -1500, cover: true}

transformKey = 'transform'

pageWidth = undefined
pageHeight = undefined
parallaxWidth = undefined

transformKey = 'webkitTransform' if document.body.style.webkitTransform?

if transformKey in ['webkitTransform', 'oTransform']
  planes.contact.rescale  = true
  planes.projects.rescale = true

resize = ->
  pageWidth = $('body').outerWidth()
  pageHeight = $('body').outerHeight()
  parallaxWidth = pageWidth * 0.6

  # Since the background is "behind" the screen plane, it needs to be
  # enlargened to cover it completely. Do this with triangle uniformity
  # mathematics. The ratio of the screen plane's width and the distance from
  # the viewer is the same as the ratio of the "full" background width and the
  # distance from the viewer. i.e
  # 
  #    screen distance / screen width = (screen distance - plane z) / plane width
  # => plane width = screen width * (screen distance - plane z) / screen distance
  # => plane width = screen width * (1 - plane z / screen distance)

  for own name, plane of planes
    plane.el = document.querySelector('.' + name) unless plane.el?

    # plane-to-screen ratio
    ratio = 1.0 - plane.z / depth

    if plane.cover?
      plane.el.style.width  = (pageWidth*ratio  + 2*tiltWidth)  + 'px'
      plane.el.style.height = (pageHeight*ratio + 2*tiltHeight) + 'px'
      plane.el.style.left = pageWidth * (1.0 - ratio) / 2  - tiltWidth  + 'px'
      plane.el.style.top  = pageHeight * (1.0 - ratio) / 2 - tiltHeight + 'px'

    if plane.align?

      if plane.rescale
        offset = plane.offset + pageWidth * plane.z / depth / 2
        plane.el.style[transformKey + 'Origin'] = plane.align

      plane.el.style[plane.align] = (offset ? plane.offset) + 'px'

# set x coordinate, where x=0 is the middle of the viewport
update = (x) ->
  for own name, plane of planes
    updatePlane(name, plane, x)

sgn = (v) -> v / Math.abs(v)

updatePlane = (name, plane, x) ->
  xt = Math.min(+1.0, Math.max(-1.0, (x ? prevX) / parallaxWidth * 2))
  xtEased = sgn(xt) * easing(Math.abs(xt))
  plane.el = document.querySelector('.' + name) unless plane.el?
  transform  = 'translate3d(' + Math.floor((plane.x ? 0) - tiltWidth*xt) + 'px, ' \
                              + Math.floor(plane.y ? 0) + 'px, ' \
                              + Math.floor(plane.z ? 0) + 'px)'
  transform += ' scale(' + (1.0 - plane.z / depth) + ')' if plane.rescale?
  transform += ' ' + plane.transform if plane.transform?
  plane.el.style[transformKey] = transform

prevX = undefined

$(document).mousemove (event) ->
  x = event.pageX - pageWidth/2
  update(x) if x != prevX
  prevX = x

$(document).resize(resize)

# In case browser restores state
$(document).ready ->
  resize()
  update(prevX ? 0)

resize()
update(0)

### KONAMI CODE ###

$.fn.konami = (callback) ->
  code = ",38,38,40,40,37,39,37,39,66,65$"
  numKeys = code.split(',').length

  return @each ->
    kkeys = ['']
    $(this).keydown (e) ->
      kkeys = kkeys.slice Math.max(0, kkeys.length - numKeys)
      kkeys.push e.keyCode
      if (kkeys.toString() + '$').indexOf(code) >= 0
        $(this).unbind 'keydown', arguments.callee
        callback()

goCrazy = ->
  secondsPerBanana = 1/10  # second per 10 bananas
  maxBananas = 200
  bananas = []

  bananaContainer = document.body
  $(bananaContainer).addClass 'bananas'

  banana = ->
    ratio = 1.0 - planes.background.z / depth
    plane = {
      el: document.createElement('banana')
      x: ratio*pageWidth*(Math.random() - 0.5)
      y: ratio*pageHeight*(Math.random() - 0.5)
      z: planes.background.z
      dx: +100*(2*Math.random() - 1)
      dy: -100*(Math.random() + 1)
      dz: +200*(Math.random() + 1)
      ddy: 80
      ddx: 0
      ddz: -2
    }
    bananaContainer.appendChild plane.el

    planes['banana' + bananas.length] = plane
    bananas.push plane
    updatePlane 'banana', plane

  clean = ->
    bananas = bananas.filter (plane, i) ->
      if plane.y < 2*pageHeight and plane.z < depth
        return true
      bananaContainer.removeChild(plane.el)
      delete planes['banana' + i]
      return false

  simulate = (t) ->
    for own i, plane of bananas
      plane.x  += t*(plane.dx + plane.ddx*t/2)
      plane.y  += t*(plane.dy + plane.ddy*t/2)
      plane.z  += t*(plane.dz + plane.ddz*t/2)
      plane.dx += t*plane.ddx
      plane.dy += t*plane.ddy
      plane.dz += t*plane.ddz
      updatePlane('banana', plane)

  t0 = Number(new Date())/1e3
  tBanana = t0
  tClean = t0

  setInterval(->

    t1 = Number(new Date())/1e3

    if (t1 - tBanana) >= secondsPerBanana and bananas.length < maxBananas
      banana()
      tBanana = t1

    if (t1 - tClean) >= 5*secondsPerBanana
      clean()
      tClean = t1

    simulate(t1 - t0)

    t0 = t1

  , 50)

$(document).konami goCrazy
$(document).on 'dblclick', (ev) ->
  console.log ev.target
  if $(ev.target.parentNode).hasClass('content')
    $(document).unbind 'dblclick', arguments.callee
    goCrazy()

