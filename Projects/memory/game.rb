# The Game should have instance variable for the Board and the 
# previously-guessed position (if any). It should also have 
# methods for managing the Board-Player interaction. You may 
# want a play loop that runs until the game is over. Inside the 
# loop, you should render the board, prompt the player for input, 
# and get a guessed pos. Pass this pos to a make_guess method, 
# where you will handle the actual memory/matching logic. Some 
# tips on implementing this:

# If we're not already checking another Card, leave the card at 
# guessed_pos face-up and update the previous_guess variable.
# If we are checking another card, we should compare the Card at 
# guessed_pos with the one at previous_guess.
# If the cards match, we should leave them both face-up.
# Else, flip both cards face-down.
# In either case, reset previous_guess.
# It wouldn't be an interesting game if the player could see 
# their previous moves. Run system("clear") before rendering the 
# Board. This will hide any previous output from the player. sleep(n) 
# will pause the program for n seconds. Use this method to (temporarily) 
# show the player an incorrect guess before flipping the Cards face-down again.

require_relative "board.rb"
# require_relative "card.rb"

class Game

    attr_reader :board

    def initialize(size=4)
        @board = Board.new(size)
        @board.populate
    end

    def run
        until @board.won?
            @board.show_board
            f_guess = get_guess
            @board.show_board
            s_guess = get_guess
            @board.show_board
            if check_match(f_guess, s_guess)
                puts "Good job, keep guessing"
            else
                puts "Not a match, try again"
            end
        end
        puts "You Win!"
    end


    def get_guess
        puts "Enter a coordinate. Example: 0 3"
        guess = gets.chomp.split.map { |ele| ele.to_i}
        @board[guess].show_card
        @board[guess]
    end

    def check_match(f_guess, s_guess)
        if !f_guess.==(s_guess)
            f_guess.hide_card
            s_guess.hide_card
            return false
        end
        true
    end
        





end