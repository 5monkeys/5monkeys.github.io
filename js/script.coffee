pageWidth = $('body').outerWidth()
parallaxWidth = pageWidth * 0.6

# En snel easing funktion :))
easeOutQuart = (d) -> (t) -> - (Math.pow(t/d-1, 4) - 1);
easing = easeOutQuart(1.8)

mouseX = undefined
container = undefined

$(document).ready(->
    $(document).on 'mousemove', (event) ->
        mouseX = event.pageX
        update()

    container = $('body')
)

update = ->
    window.requestAnimationFrame(step) if REQUEST_ANIM

    p = Math.min(+1.0, Math.max(0, (mouseX - pageWidth / 3) / parallaxWidth * 2))
    #p = (window.mouseX / pageWidth)

    if container
       container.style.perspectiveOriginX = p * 100 + '%'

window.requestAnimationFrame(update)
