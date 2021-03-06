require "minitest/autorun"
require "minitest/mock"
require_relative "../src/actions/actions"
require_relative "../src/model/state"

class ActionTest < Minitest::Test 

    def setup
        @initial_state = Model::State.new(
            Model::Snake.new([
                Model::Coord.new(1,1),
                Model::Coord.new(0,1)
            ]),
            Model::Food.new(4,4),
            Model::Grid.new(16,24),
            Model::Direction::RIGHT,
            false,
            2.0
        )
    end


    def test_move_snake
        expected_state = Model::State.new(
            Model::Snake.new([
                Model::Coord.new(2,1),
                Model::Coord.new(1,1)
            ]),
            Model::Food.new(4,4),
            Model::Grid.new(16,24),
            Model::Direction::RIGHT,
            false,
            2.0
        )
        actual_state = Actions::move_snake(@initial_state)
        assert_equal actual_state, expected_state
    end

    def test_change_direction_invalid
        expected_state = Model::State.new(
            Model::Snake.new([
                Model::Coord.new(1,1),
                Model::Coord.new(0,1)
            ]),
            Model::Food.new(4,4),
            Model::Grid.new(16,24),
            Model::Direction::RIGHT,
            false,
            2.0
        )
        actual_state = Actions::change_direction(@initial_state,Model::Direction::LEFT)
        assert_equal actual_state, expected_state
    end

    def test_change_direction_valid
        expected_state = Model::State.new(
            Model::Snake.new([
                Model::Coord.new(1,1),
                Model::Coord.new(0,1)
            ]),
            Model::Food.new(4,4),
            Model::Grid.new(16,24),
            Model::Direction::DOWN,
            false,
            2.0
        )
        actual_state = Actions::change_direction(@initial_state,Model::Direction::DOWN)
        assert_equal actual_state, expected_state
    end

    def test_grow_snake
        initial_state = Model::State.new(
            Model::Snake.new([
                Model::Coord.new(1,1),
                Model::Coord.new(0,1)
            ]),
            Model::Food.new(2,1),
            Model::Grid.new(16,24),
            Model::Direction::RIGHT,
            false,
            2.0
        )
        expected_state = Model::State.new(
            Model::Snake.new([
                Model::Coord.new(2,1),
                Model::Coord.new(1,1),
                Model::Coord.new(0,1)
            ]),
            Model::Food.new(2,1),
            Model::Grid.new(16,24),
            Model::Direction::RIGHT,
            false,
            2.0
        )
        actual_state = Actions::move_snake(initial_state)
        assert_equal actual_state.snake, expected_state.snake
    end

    def test_generate_food 
        initial_state = Model::State.new(
            Model::Snake.new([
                Model::Coord.new(1,1),
                Model::Coord.new(0,1)
            ]),
            Model::Food.new(2,1),
            Model::Grid.new(16,24),
            Model::Direction::RIGHT,
            false,
            2.0
        )
        expected_state = Model::State.new(
            Model::Snake.new([
                Model::Coord.new(2,1),
                Model::Coord.new(1,1),
                Model::Coord.new(0,1)
            ]),
            Model::Food.new(0,0),
            Model::Grid.new(16,24),
            Model::Direction::RIGHT,
            false,
            2.0
        )
        Actions.stub(:rand, 0) do
            actual_state = Actions::move_snake(initial_state)
            assert_equal actual_state.food, expected_state.food
        end 
    end

    def test_speed
        initial_state = Model::State.new(
            Model::Snake.new([
                Model::Coord.new(1,1),
                Model::Coord.new(0,1)
            ]),
            Model::Food.new(2,1),
            Model::Grid.new(16,24),
            Model::Direction::RIGHT,
            false,
            2.0
        )
        expected_state = Model::State.new(
            Model::Snake.new([
                Model::Coord.new(2,1),
                Model::Coord.new(1,1),
                Model::Coord.new(0,1)
            ]),
            Model::Food.new(2,1),
            Model::Grid.new(16,24),
            Model::Direction::RIGHT,
            false,
            3.0
        )
        actual_state = Actions::move_snake(initial_state)
        assert_equal actual_state.speed, expected_state.speed
    end
end