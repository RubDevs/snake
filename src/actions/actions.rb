module Actions
    def self.move_snake(state)
        next_direction = state.next_direction
        next_position = calc_next_position(state)
        # Verify next place is valid
        if position_is_valid?(state, next_position)
            move_snake_to(state,next_position)
        else
            end_game(state)
        end
    end

    private

    def calc_next_position(state)
        current_position = state.snake.postions.first
        next_position = []
        case state.next_direction
        when UP
            return Model::Coord.new(
                current_position.x,
                current_position.y - 1)
        when DOWN
            return Model::Coord.new(
                current_position.x,
                current_position.y + 1)
        when RIGHT
            return Model::Coord.new(
                current_position.x + 1,
                current_position.y)
        when LEFT
            return Model::Coord.new(
                current_position.x - 1,
                current_position.y)

        end

    end

    def position_is_valid(state, next_position)
    
    end

    def move_snake_to
    end
    
end