#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative '../lib/conway'

module Conway
  # Minitest Unit Tests for a Cell
  class CellTest < Minitest::Test
    def setup
      @cell = Cell.new
    end

    def test_that_it_works
      assert @cell.instance_of?(Cell)
    end

    def test_cell_is_not_alive
      refute @cell.alive?
    end

    def test_kill_a_cell
      @cell.kill
      refute @cell.alive?
    end

    def test_set_a_cell_alive
      @cell.set_alive
      assert @cell.alive?
    end
  end
end
