class Board
    attr_reader :size
  
    def initialize(n)
        @grid = Array.new(n){Array.new(n, :N)}
        @size = n * n
    end

    def [](pairs)
        row, column = pairs
        @grid[row][column]
    end

    def []=(pairs, value)
        row, column = pairs
        @grid[row][column] = value
    end

    def num_ships
        @grid.flatten.count(:S)
    end

    def attack(pos)
        if self.[](pos) == :S
           self.[]=(pos, :H)
            puts 'you sunk my battleship!'
            return true
        else
            self.[]=(pos, :X)
            return false
        end
    end

    def place_random_ships
        max_ships = 0.25 * self.size

    while self.num_ships < max_ships
      row = rand(0...@grid.length)
      col = rand(0...@grid.length)
      pos = [row, col]
      self[pos] = :S
    end
    end

    def hidden_ships_grid
    @grid.map do |row|
      row.map do |ele|
        if ele == :S
          :N
        else
          ele
        end
      end
    end
  end

  def self.print_grid(grid)
    grid.each do |row|
        puts row.join(" ") 
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end

end
