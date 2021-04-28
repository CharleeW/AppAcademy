# Game
# The Game should have an instance variable for the Board. 
# It should also have methods for managing the Board-Player 
# interaction. You may want a play loop that runs until the 
# puzzle is solved. Inside the loop, you should render the board, 
# prompt the player for input, and then get both a pos and a value 
# from the player. It should then update the tile at pos with the new 
# value. I wrote helper methods to get and validate input from the user; 
# this should help keep our program from crashing. :)

require_relative "board.rb"

class Game
    attr_reader :board

    def initialize
        @board = Board.new
    end

    def run
        until @board.solved?
            @board.show_board
            get_guess
        end
        @board.show_board
        puts "You Win!"
    end

    def get_guess
        spot = nil
        guess = nil
        while !valid_guess(spot, guess)
            puts "Enter a spot and a value. Example: 00 2"
            spot, guess = gets.chomp.split(" ")
        end
        
        @board[spot]= guess.to_i

    end

    def valid_guess(spot, guess)
        return false if spot == nil || guess == nil
        spot.length == 2 && (guess.to_i > 0 && guess.to_i <= 9)
    end


end
