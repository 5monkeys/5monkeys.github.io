
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

    update: (event, p) =>
        offset = @k * -p  # Negate p % to move opposite direction as mouse
        if Math.abs(offset - @offset) >= 1  # Only transform layer if offset changed a pixel or more
            @offset = Math.floor offset
            @render()

    initialize: () ->
        """
        Initialize layer such as position and related styling etc.
        """
        throw Error('Not implemented')

    render: () ->
        """
        Render updated layer position
        """
        throw Error('Not implemented')


class ImageLayer extends Layer

    initialize: () ->
        @$el.css
            'background-size': "#{@$el.outerWidth() + @k * 2.0}px auto"
        @render()

    render: () ->
        @el.style.backgroundPosition = "#{@x + @offset}px top"


class PositionLayer extends Layer

    initialize: () ->
        @$el.css
            left: "#{@x}px"

    render: () ->
        @$el.css
            left: "#{@x + @offset}px"


class TranslationLayer extends PositionLayer

    render: () ->
#        console.log @el.className, 'offset:', @offset, 'k:', @k, 'x:', @x

#        # TODO: Don't transform non visible layers
#        if @x + @offset + @width < 0
#            console.log 'skipping', @el.className
#            return

#        else if @x + offset > pageWidth
#            console.log 'skipping', @el.className
#            return

        @$el.css
            'transform': "translate(#{@offset}px, 0)"


class World

    constructor: (options) ->
        @page =
            width: $('body').outerWidth()
        @parallax =
            width: @page.width * 0.6
        @layers = []
        @mouse =
            x: undefined

        @$document = $ document
        @$document.on 'mousemove', @mousemove

    addLayer: (layer) ->
        @layers.push layer
        @$document.on 'world:changed', layer.update

    mousemove: (event) =>
        x = event.pageX
#        console.log x

        if @mouse.x is undefined
            # First mouse event
            # TODO: animate-to/catch cursor but still react on mouse move to update animation endpoint?
            @mouse.x = x
        else if Math.abs(x - @mouse.x) < 1.0
            # Experimental: Ignore mouse delta less than a pixel
            return
        else
            @mouse.x = x

        p = Math.min(+1.0, Math.max(-1.0, (@mouse.x - @page.width / 2) / @parallax.width * 2))
        pEased = (p / Math.abs p) * easing(Math.abs p)

        @$document.trigger 'world:changed', [pEased]


easeOutQuart = (d) -> (t) -> - (Math.pow(t / d - 1, 4) - 1)
easing = easeOutQuart 1.8

world = new World

world.addLayer new ImageLayer '.background', {x: -20.0, k: 20.0}
world.addLayer new TranslationLayer '.content', {k: 40.0}
world.addLayer new TranslationLayer '.contact', {x: -200.0, k: 200.0}
world.addLayer new TranslationLayer '.projects', {x: world.page.width, k: 200.0}
