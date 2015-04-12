vzero   = {x: 0, y: 0}
vunit   = {x: 1, y: 1}
vadd    = (a, b) -> {x: b.x + a.x, y: b.y + a.y}
vmul    = (a, b) -> {x: a.x * b.x, y: a.y * b.y}
vdiv    = (a, b) -> {x: a.x / b.x, y: a.y / b.y}
vscale  = (a, k) -> {x: k*a.x, y: k*a.y}
vsub    = (a, b) -> vadd(a, vscale(b, -1))
vdot    = (a, b) -> a.x*b.x + a.y*b.y
vnorm2  = (a) -> vdot(a, a)
vnorm   = (a) -> Math.sqrt(vnorm2(a))
vmin    = (a, k) -> {x: Math.min(a.x, k), y: Math.min(a.y, k)}
vmax    = (a, k) -> {x: Math.max(a.x, k), y: Math.max(a.y, k)}

pageSize = undefined
parallaxSize = undefined

# measurements in pixels
depth       = 3000
tiltSize    = vscale(vunit, 100)

# NOTE Elements below z-level 0 are unclickable
# NOTE If you change these, update the CSS also.
planes =
  'header .logo':   {z:   -480, rescale: true}
  'header .slogan': {z:   -240, rescale: true}
  '.projects':      {z:     0}
  '.contact':       {z:     0}
  '.background':    {z: -1000, cover: true}

transformKey = 'transform'
transformKey = 'webkitTransform' if document.body.style.webkitTransform?
transformKey = 'mozTransform' if document.body.style.mozTransform?

resize = ->
  pageSize    = {x: $('body').outerWidth(), y: $('body').outerHeight()}
  parallaxSize = vscale(pageSize, 0.6)

  # Since the background is "behind" the screen plane, it needs to be
  # enlargened to cover it completely. Do this with triangle uniformity
  # mathematics. The ratio of the screen plane's width and the distance from
  # the viewer is the same as the ratio of the "full" background width and the
  # distance from the viewer. i.e
  # 
  #    screen distance / screen width = (screen distance - plane z) / plane width
  # => plane width = screen width * (screen distance - plane z) / screen distance
  # => plane width = screen width * (1 - plane z / screen distance)

  console.log 'Updating viewport size to', pageSize

  for own name, plane of planes
    plane.el = document.querySelector(name) unless plane.el?

    # plane-to-screen ratio
    ratio = 1.0 - plane.z / depth

    if plane.cover?
      elSize = vadd(vscale(pageSize, ratio), vscale(tiltSize, 2))
      elPos  = vsub(vscale(pageSize, (1.0 - ratio) / 2), tiltSize)
      plane.el.style.width  = elSize.x + 'px'
      plane.el.style.height = elSize.y + 'px'
      plane.el.style.left   = elPos.x + 'px'
      plane.el.style.top    = elPos.y + 'px'

# set x coordinate, where x=0 is the middle of the viewport
update = (pos) ->
  for own name, plane of planes
    updatePlane(name, plane, pos)

updatePlane = (name, plane, pos) ->
  # Normalize position by parallaxing size
  rt = vscale(vdiv(pos ? pos0, parallaxSize), 2)

  # Clamp to [-1, +1]
  rt = vmin(vmax(rt, -1.0), +1.0)

  # Multiply by tilting size
  rt = vmul(rt, tiltSize)

  # Apply plane offset
  rt = vsub({x: plane.x ? 0, y: plane.y ? 0}, rt)

  plane.el = document.querySelector('.' + name) unless plane.el?
  transform  = 'translate3d(' + Math.floor(rt.x) + 'px, ' \
                              + Math.floor(rt.y) + 'px, ' \
                              + Math.floor(plane.z ? 0) + 'px)'
  transform += ' scale(' + (1.0 - plane.z / depth) + ')' if plane.rescale?
  transform += ' ' + plane.transform if plane.transform?
  plane.el.style[transformKey] = transform

pos0 = undefined
updateMousePos = (event) ->
  return if pageSize.x < 570
  mousePos = {x: event.pageX, y: event.pageY}
  pos = vsub(mousePos, vscale(pageSize, 1/2))
  update(pos) if pos0? and vnorm2(vsub(pos0, pos)) > 0
  pos0 = pos

$(document).resize(resize)
$(document).mousemove(updateMousePos)
resize()
update(vzero)

# In case browser restores state
$(document).ready ->
  resize() unless pageSize?
  update(pos0 ? vzero)

# Bananas below

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
  secondsPerBanana = 1/10
  maxBananas = 200
  timeStep = 1e-2
  bananas = []
  freeEls = []

  bananaContainer = document.body
  backgroundZ = planes['.background'].z
  $(bananaContainer).addClass 'bananas'

  console.log "%cBANANAS!", "font-size: 126pt"

  audioEl = $('<audio src="mp3/chimp.mp3" autoplay></audio>')
  audioEl.on('play', -> setTimeout(throwBananas, 6e3))
  $(bananaContainer).append(audioEl)

  throwBananas = ->
    t0 = Number(new Date())/1e3

    banana = ->
      ratio = 1.0 - backgroundZ / depth
      plane = {
        name: 'banana' + String(t0)
        t0: t0
        x0: ratio*pageSize.x*(Math.random() - 0.5)
        y0: ratio*pageSize.y*(Math.random() - 0.5)
        z0: backgroundZ
        dx: +100*(2*Math.random() - 1)
        dy: -100*(Math.random() + 1)
        dz: +500*(Math.random() + 1)
        ddy: 80
        ddx: 0
        ddz: -2
      }

      if freeEls.length > 0
        plane.el = freeEls.pop()
      else
        plane.el = document.createElement('banana')
        bananaContainer.appendChild plane.el

      planes[plane.name] = plane
      bananas.push plane

    updateBananaPosition = (t, plane) ->
      plane.x = plane.x0 + t*(plane.dx + plane.ddx*t/2)
      plane.y = plane.y0 + t*(plane.dy + plane.ddy*t/2)
      plane.z = plane.z0 + t*(plane.dz + plane.ddz*t/2)
      updatePlane 'banana', plane

    clean = ->
      bananas = bananas.filter (plane) ->
        removeBanana = plane.z > depth
        if removeBanana
            delete planes[plane.name]
            freeEls.push(plane.el)
        return not removeBanana

    tBanana = t0
    tClean = t0

    updateWorld = ->
      t1 = Number(new Date())/1e3

      if (t1 - tClean) >= 5*secondsPerBanana
        clean()
        tClean = t1

      if (t1 - tBanana) >= secondsPerBanana and bananas.length < maxBananas
        banana()
        tBanana = t1

      for own i, plane of bananas
        updateBananaPosition(t1 - plane.t0, plane)

      t0 = t1

    updateWorld()
    setInterval(updateWorld, 10)

$(document).konami goCrazy
$(document).on 'dblclick', (ev) ->
  $(document).unbind 'dblclick', arguments.callee
  goCrazy()
