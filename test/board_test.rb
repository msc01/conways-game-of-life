#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative '../lib/conway'

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

    def test_number_of_neighboring_cells_alive_are_zero
      @board.cells[1][1].set_alive
      assert_equal 0, @board.number_of_neighboring_cells_alive(1, 1)
    end

    def test_number_of_neighboring_cells_alive_are_one
      @board.cells[0][0].set_alive
      assert_equal 1, @board.number_of_neighboring_cells_alive(1, 1)
    end

    def test_cell_2_2_has_3_neighbors
      assert_equal 3, @board.number_of_neighboring_cells(2, 2)
    end

    def test_cell_0_0_has_3_neighbors
      assert_equal 3, @board.number_of_neighboring_cells(0, 0)
    end

    def test_cell_1_1_has_8_neighbors
      assert_equal 8, @board.number_of_neighboring_cells(1, 1)
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
  end
end
