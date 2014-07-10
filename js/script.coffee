pageWidth = $('body').outerWidth()
parallaxWidth = pageWidth * 0.6

# En snel easing funktion :))
easeOutQuart = (d) -> (t) -> - (Math.pow(t/d-1, 4) - 1);
easing = easeOutQuart(1.8)

window.mouseX = 0
window.container = null

$(document).ready(->
    $(document).on 'mousemove', (event) ->
        window.mouseX = event.pageX
        step() if not REQUEST_ANIM

    window.container = $('body')
)
REQUEST_ANIM = false

step = ->
    window.requestAnimationFrame(step) if REQUEST_ANIM

    p = Math.min(+1.0, Math.max(0, (window.mouseX - pageWidth / 3) / parallaxWidth * 2))
    #p = (window.mouseX / pageWidth)

    origin = p * 100 + '% 50%'

    console.log origin

    if window.container
        window.container.css('perspective-origin', origin)

window.requestAnimationFrame(step,) if REQUEST_ANIM