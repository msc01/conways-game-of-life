# Conway's game of live
module Conway
  # Represents a Board
  class Board
    attr_accessor :cells

    def initialize(width: 3, height: 3)
      @width = width
      @height = height
      @cells = Array.new(width) { Array.new(height) { Cell.new } }
    end

    def next_generation
      new_generation = Array.new(@width) { Array.new(@height) { Cell.new } }
      x = 0
      while x < @width
        y = 0
        while y < @height
          new_generation[x][y].kill      if number_of_neighboring_cells_alive(x, y) < 2
          new_generation[x][y].set_alive if number_of_neighboring_cells_alive(x, y) == 2 || number_of_neighboring_cells_alive(x, y) == 3
          new_generation[x][y].kill      if number_of_neighboring_cells_alive(x, y) > 3
          y += 1
        end
        x += 1
      end
      @cells = new_generation
    end

    def show
      system 'clear'
      x = 0
      while x < @width
        y = 0
        while y < @height
          if cells[x][y].alive?
            print '*'
          else
            print ' '
          end
          y += 1
        end
        puts
        x += 1
      end
    end

    private

    def number_of_neighboring_cells_alive(x, y)
      neighboring_cells(x, y).count { |c| c.alive? }
    end

    def neighboring_cells(x, y)
      array_of_cells = []

      array_of_cells << cells[x - 1][y - 1] if x > 0 && y > 0
      array_of_cells << cells[x][y - 1]     if y > 0
      array_of_cells << cells[x + 1][y - 1] if x < (@width - 1) && y > 0
      array_of_cells << cells[x - 1][y]     if x > 0
      array_of_cells << cells[x + 1][y]     if x < (@width - 1)
      array_of_cells << cells[x - 1][y + 1] if x > 0 && y < (@height - 1)
      array_of_cells << cells[x][y + 1]     if y < (@height - 1)
      array_of_cells << cells[x + 1][y + 1] if x < (@width - 1) && y < (@height - 1)

      array_of_cells
    end
  end
end
