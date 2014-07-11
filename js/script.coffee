# En snel easing funktion :))
easeOutQuart = (d) -> (t) -> - (Math.pow(t/d-1, 4) - 1);
easing = easeOutQuart(1.8)

# measurements in pixels
depth = 1000
tiltWidth = 200
tiltHeight = 0

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

    # pw + offset = w/2
    #      offset = w/2 - pw
    #      offset = w(pz/d)/2

    # offset           = pw (d / (d - pz) - 1)
    # (1 - pz/d)/(w/2)
    # offset           = (1 - pz/d)/(w/2) * (d / (d - pz) - 1)
    # 

    if plane.align?

      if plane.rescale
        offset = plane.offset + pageWidth * plane.z / depth / 2
        plane.el.style[transformKey + 'Origin'] = plane.align

      plane.el.style[plane.align] = (offset ? plane.offset) + 'px'

# set x coordinate, where x=0 is the middle of the viewport
update = (x) ->
  xt = Math.floor(-tiltWidth * Math.min(+1.0, Math.max(-1.0, x / parallaxWidth * 2)))

  for own name, plane of planes
    plane.el = document.querySelector('.' + name) unless plane.el?
    transform  = 'translate3d(' + xt + 'px, 0, ' + plane.z + 'px)'
    transform += ' scale(' + (1.0 - plane.z / depth) + ')' if plane.rescale?
    transform += ' ' + plane.transform if plane.transform?
    plane.el.style[transformKey] = transform

prevX = undefined

$(document).mousemove (event) ->
  x = event.pageX - pageWidth/2
  update(x) if x != prevX
  prevX = x

$(document).resize(resize)

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

$(document).konami ->
  console.log 'raise your donger!'
  plane = {
    z: 300*(Math.random()-1),
    el: document.createElement 'img'
  }
  $(document.body).addClass 'rustle'
  plane.el.style.position = 'absolute'
  plane.el.style.left = Math.random() * pageWidth + 'px'
  plane.el.style.top = Math.random() * pageHeight + 'px'
  plane.el.src = 'static/banana.png'
  plane.transform = 'rotateX(45deg)'
  setInterval(->
    planes.content.z -= 1
    update(prevX)
  , 100)
  document.body.appendChild plane.el
  planes['rustler'] = plane
