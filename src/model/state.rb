# Archivo para representar el estado del juego

module Model
    module Direction
        UP = :up
        RIGHT = :right
        DOWN = :down 
        LEFT = :left 
    end
    class Coord < Struct.new(:x,:y)
    end

    class Food < Coord
    end

    class Snake < Struct.new(:positions)
    end

    class Grid < Struct.new(:rows,:cols)
    end

    class State < Struct.new(:snake,:food,:grid, :current_direction, :game_finished, :speed)
    end

    def self.initial_state
        Model::State.new(
            Model::Snake.new([
                Model::Coord.new(1,1),
                Model::Coord.new(0,1)
            ]),
            Model::Food.new(4,4),
            Model::Grid.new(16,24),
            Direction::RIGHT,
            false,
            2.0
        )
    end
end