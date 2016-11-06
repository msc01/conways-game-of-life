require_relative 'test_helper'

module Conway
  # Minitest Unit Tests for a Board
  class BoardTest < Minitest::Test
    def setup
      @board = Board.new
    end

    def test_that_it_works
      assert @board.instance_of?(Board)
    end

    def test_that_a_certain_cell_is_dead_in_the_beginning
      refute @board.cells[1][1].alive?
    end

    def test_to_set_a_certain_cell_alive
      @board.cells[0][0].set_alive
      assert @board.cells[0][0].alive?
    end

    def test_to_set_a_certain_cell_alive_and_no_other
      @board.cells[0][0].set_alive
      refute @board.cells[0][1].alive?
      refute @board.cells[1][0].alive?
    end

    def test_rule_1_under_population
      @board.cells[1][1].set_alive
      @board.cells[2][2].set_alive
      @board.next_generation
      refute @board.cells[1][1].alive?
    end

    def test_rule_2_survival
      @board.cells[1][0].set_alive
      @board.cells[1][1].set_alive
      @board.cells[2][1].set_alive
      @board.cells[2][2].set_alive
      @board.next_generation
      assert @board.cells[1][1].alive?
    end

    def test_rule_3_overcrowding
      @board.cells.flatten.each { |c| c.set_alive }
      @board.next_generation
      refute @board.cells[1][1].alive?
    end

    def test_output
      @board.cells[1][1].set_alive
      @board.show
    end
  end
end
