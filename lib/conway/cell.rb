# Conway's game of live
module Conway
  # Represents a single cell
  class Cell
    def initialize(alive: false)
      @alive = alive
    end

    def alive?
      @alive
    end

    def kill
      @alive = false
    end

    def set_alive
      @alive = true
    end
  end
end
