
class Layer

    constructor: (element, options) ->
        defaults =
            x: 0.0
            k: 100.0
            offset: 0.0

        options = $.extend defaults, options

        @$el = $ element
        @el = @$el[0]
        @width = @$el.outerWidth()

        @offset = options.offset
        @k = options.k
        @x = options.x or @offset

        console.log @el.className, 'offset:', @offset, 'k:', @k, 'x:', @x

        @initialize()

    update: (p) ->
        offset = @k * -p  # + @origin.x
        if Math.abs(offset - @offset) >= 0
            @offset = offset
            @transform()

    initialize: () ->
        return

    transform: () ->
        return


class ImageLayer extends Layer

    initialize: () ->
        @$el.css
            'background-size': "#{@$el.outerWidth() + @k * 2.0}px auto"
        @transform()


    transform: () ->
        offset = Math.floor @x + @offset
        @el.style.backgroundPosition = "#{offset}px top"


class TranslationLayer extends Layer

    initialize: () ->
        @$el.css
            left: "#{@x}px"

    transform: () ->
        offset = Math.floor @offset

#        console.log @el.className, 'offset:', @offset, 'k:', @k, 'x:', @x

        # TODO: Don't transform non visible layers
#        if @x + @offset + @width < 0
#            console.log 'skipping', @el.className
#            return

#        else if @x + offset > pageWidth
#            console.log 'skipping', @el.className
#            return

        @$el.css
            'transform': "translate(#{offset}px, 0)"


pageWidth = $('body').outerWidth()
parallaxWidth = pageWidth * 0.6

layers = [
    new ImageLayer '.background', {x: -20.0, k: 20.0}
    new TranslationLayer '.content', {k: 40.0}
    new TranslationLayer '.contact', {x: -200.0, k: 200.0}
    new TranslationLayer '.projects', {x: pageWidth, k: 200.0}
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

#    window.requestAnimationFrame ->
    pendingAnimFrame = false

    p = Math.min(+1.0, Math.max(-1.0, (mouseX - pageWidth / 2) / parallaxWidth * 2))
    pEased = (p/Math.abs(p)) * easing(Math.abs(p))

    for layer in layers
        layer.update pEased
