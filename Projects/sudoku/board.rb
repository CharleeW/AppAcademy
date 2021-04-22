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
        @grid.each {|row| puts row.value}
    end

    def [](pos)
        row, col = pos[0], pos[1]
        @board[row, col]
    end

    def []=(pos, guess)
        @board[pos].guess_value = guess
    end

end