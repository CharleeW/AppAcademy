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
require_relative "card.rb"

class Game

    def initialize(size)
        @grid = Board.new(size)
    end

    def run
        until @grid.won?
        @grid.show_board
        get_guess
        end
    end


    def get_guess
        puts "Enter a coordinate. Example: 0,3"
        f_guess = gets.chomp
        @grid[f_guess].show_face
        self.show_board
        puts "Enter a 2nd coordinate. Example: 0,3"
        s_guess = gets.chomp
        @grid[s_guess].show_face

        if @grid[f_guess].value != @grid[s_guess].value
            @grid[f_guess].face_up = false
            @grid[s_guess].face_up = false
        end
    end
        
        





end