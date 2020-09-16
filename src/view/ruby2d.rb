require "ruby2d"

module View
    class Ruby2dView
        def initialize
            @pixel_size = 50
        end

        def render(state)
            extend Ruby2D::DSL
            set(
                title: "Snake", 
                width: @pixel_size * state.grid.cols, 
                height: @pixel_size * state.grid.rows
            )
            render_food(state)
            render_snake(state)
            show
        end

        private

        def render_food(state)
            extend Ruby2D::DSL
            Square.new(
                x: state.food.x * @pixel_size,
                y: state.food.y * @pixel_size,
                size: @pixel_size,
                color: 'yellow'
            )
        end

        def render_snake(state)
        end
    end
    
end