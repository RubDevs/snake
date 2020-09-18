module Actions
    def self.move_snake(state)
        next_direction = state.current_direction
        next_position = calc_next_position(state)
        # Verify if next place is food
        if position_is_food?(state,next_position)
            state = grow_snake(state,next_position)
            new_food(state)
        # Verify next place is valid
        elsif position_is_valid?(state, next_position)
            move_snake_to(state,next_position)
        else
            end_game(state)
        end
    end

    def self.change_direction(state, direction)
        if next_direction_is_valid?(state,direction)
            state.current_direction = direction
        else
            puts "Invalid direction"
        end
        state
    end

    private

    def self.calc_next_position(state)
        current_position = state.snake.positions.first
        #next_position = []
        case state.current_direction
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

    def self.position_is_food?(state, next_direction)
        state.food.x == next_direction.x && state.food.y == next_direction.y 
    end

    def self.grow_snake(state, next_position)
        state.snake.positions = [next_position] + state.snake.positions
        state
    end

    def self.new_food(state)
        new_food = Model::Food.new(rand(state.grid.cols), rand(state.grid.rows))
        state.food = new_food
        state
    end

    def self.move_snake_to(state, next_position)
        #
        new_positions = [next_position] + state.snake.positions[0...-1]
        state.snake.positions = new_positions
        state
    end

    def self.end_game(state)
        state.game_finished = true
        state
    end

    def self.next_direction_is_valid?(state, direction)
        case state.current_direction
            when Model::Direction::UP
                return true if direction != Model::Direction::DOWN
            when Model::Direction::DOWN
                return true if direction != Model::Direction::UP
            when Model::Direction::RIGHT
                return true if direction != Model::Direction::LEFT
            when Model::Direction::LEFT
                return true if direction != Model::Direction::RIGHT
        end

        return false
    end
    
end