
class Layer

    constructor: (element, options) ->
        @$el = $ element
        @el = @$el[0]
        @offset = @x = options.x
        @origin = {x: @x}
        @k = options.k
        @initialize()

    update: (p) ->
        x = @k * p + @origin.x
        if Math.abs(x - @x) >= 0
            @x = x
            @transform()

    initialize: () ->
        return

    transform: () ->
        return


class TranslationLayer extends Layer

    initialize: () ->
        @el.style.left = "#{@offset}px"

    transform: () ->
#        @el.style.webkitTransform = "translate(#{-@x}px, 0)"
        @$el.css
            'transform': "translate(#{@offset-@x}px, 0)"


class ImageLayer extends Layer

    initialize: () ->
        @$el.css
            'background-size': "#{@$el.outerWidth() + @k * 2.0}px auto"
        @transform()


    transform: () ->
        @el.style.backgroundPosition = "#{-@x}px top"


class TranslationRightLayer extends Layer

    initialize: () ->
        @offset = @x
        @el.style.left = "#{@offset}px"

    transform: () ->
#        @el.style.webkitTransform = "translate(#{@offset-@x}px, 0)"
        @$el.css
            'transform': "translate(#{@offset-@x}px, 0)"


pageWidth = $('body').outerWidth()
parallaxWidth = pageWidth * 0.6

layers = [
    new ImageLayer '.background', {x: 30.0, k: 30.0}
    new TranslationLayer '.content', {x: 0.0, k: 40.0}
    new TranslationLayer '.contact', {x: -200.0, k: 200.0}
    new TranslationRightLayer '.projects', {x: pageWidth, k: 200.0}
]

pendingAnimFrame = false
mouseX = undefined

# En snel easing funktion :))
easeOutQuart = (d) -> (t) -> - (Math.pow(t/d-1, 4) - 1);
easing = easeOutQuart(1.8)

$(document).on 'mousemove', (event) ->
    if mouseX is undefined
        mouseX = mouseX  # TODO: animate to cursor but still react on mouse move to update animation endpoint

    mouseX = event.pageX

    if pendingAnimFrame
        return

    pendingAnimFrame = true

    window.requestAnimationFrame ->
        pendingAnimFrame = false

        p = Math.min(+1.0, Math.max(-1.0, (mouseX - pageWidth / 2) / parallaxWidth * 2))
        pEased = (p/Math.abs(p)) * easing(Math.abs(p))

        for layer in layers
            layer.update pEased
