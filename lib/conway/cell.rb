module Conway
  # A cell is in one of two possible states, alive or dead.
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
