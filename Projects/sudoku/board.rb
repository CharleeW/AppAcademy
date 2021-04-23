# Board
# A Board should store a grid of Tiles. Define your 
# Board#initialize method to accept such a grid as an 
# argument. Since our puzzles exist as text files, let's 
# write a Board::from_file factory method to read a file and 
# parse it into a two-dimensional Array containing Tile instances.

# The Board class will be doing much of the heavy lifting 
# for our game's logic. It will need the following methods:

# A method to update the value of a Tile at the given position
# A render method to display the current board state
# A solved? method to let us know if the game is over
# I used several helper methods here. You will want to know 
# if each row, column, and 3x3 square has been solved.
require_relative "tile.rb"

class Board
    attr_reader :grid

    ANSWERS = [1,2,3,4,5,6,7,8,9]

    def self.get_values
        file = File.open("./puzzles/sudoku1_almost.txt")
        file_data = file.readlines.map(&:chomp)
        file_data.map! do |row|
            row.split("").map! do |value| 
                Tile.new(value) 
            end
        end
    end


    def initialize(grid = Board.get_values)
        @grid = grid
    end

    def show_board
        @grid.each do |row| 
            row.each do |col| 
                print col.value.to_s +  " | "
            end
            puts
            if @grid[2] == row || grid[5] == row || grid[8] == row
                puts "------------------------------------"
            else
                puts "          |           |           | "
            end
        end
        nil
    end

    def [](n)
        pos = n.split(" ")
        row, col = pos[0].to_i, pos[1].to_i
        self.grid[row][col]
    end

    def []=(n, value)
    pos = n.split(" ")
    row, col = pos[0].to_i, pos[1].to_i
    tile = grid[row][col]
    tile.value = value if !(tile.given)
  end

    def solved?
        @grid.rows? && @grod.cols? && @grid.squares?
    end

    def rows?
        @grid.all? do |row|
            row.map {|ele| ele.value}.sort == ANSWERS
        end
    end

    def cols?
        columns = @grid.transpose
        columns.all? do |col|
            col.map {|ele| ele.value}.sort == ANSWERS
        end
    end

    def squares?
        # r c - c+2
        # 0 0 - 2            r + 1
        # 1 0 - 2            r + 1
        # 2 0 - 2            r + 1
        # check guess       c += 3

        # r c - c+2
        # 0 3 - 5            r + 1
        # 1 3 - 5            r + 1
        # 2 3 - 5            r + 1
        # check guess       c += 3

        # r c - c+2
        # 0 6 - 8            r + 1
        # 1 6 - 8            r + 1
        # 2 6 - 8            r + 1
        # check guess       c += 3

        when c > 6, r += 3 c = 0






end