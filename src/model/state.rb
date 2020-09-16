# Archivo para representar el estado del juego

module Model
    class Coord < Struct.new(x,y)
    end

    class Food < Coord
    end

    class Snake < Struct.new(positions)
    end

    class Grid < Struct.new(rows,cols)
    end

    class State < Struct.new(snake,food,grid)
    end
end