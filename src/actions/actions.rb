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

    def self.calc_next_position(state)
        current_position = state.snake.positions.first
        next_position = []
        case state.next_direction
        when Model::Direction::UP
            return Model::Coord.new(
                current_position.x,
                current_position.y - 1)
        when Model::Direction::DOWN
            return Model::Coord.new(
                current_position.x,
                current_position.y + 1)
        when Model::Direction::RIGHT
            return Model::Coord.new(
                current_position.x + 1,
                current_position.y)
        when Model::Direction::LEFT
            return Model::Coord.new(
                current_position.x - 1,
                current_position.y)

        end

    end

    def self.position_is_valid?(state, position)
        # Verificar que este dentro del grid
        is_invalid = ((position.x < 0 || position.x >= state.grid.cols) ||
            (position.y < 0 || position.y >= state.grid.rows))
        return false if is_invalid
        # Verificar que no se superponga a la serpiente
        return !(state.snake.positions.include? position)
    end

    def self.move_snake_to(state, next_position)
        #
        new_positions = [next_position] + state.snake.positions[0...-1]
        state.snake.positions = new_positions
        state
    end

    def self.end_game
        state.game_finished = true
        state
    end
    
end