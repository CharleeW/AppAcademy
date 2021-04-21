# The Board is responsible for keeping track of 
# all your Cards. You'll want a grid instance variable 
# to contain Cards. Useful methods:

# #populate should fill the board with a set of 
# shuffled Card pairs
# #render should print out a representation of the Board's current state
# #won? should return true if all cards have been revealed.
# #reveal should reveal a Card at guessed_pos (unless 
# it's already face-up, in which case the method should do nothing). 
# It should also return the value of the card it revealed (you'll see why later).

require_relative "card.rb"

class Board
    attr_accessor :grid

    def initialize(size=4)
        @grid = Array.new(size) {Array.new(size){Card.new}}
    end

    def populate
        pairs = get_pairs
        i = 0
        
        @grid.each do |row|
            row.each do |card|
                card.value = pairs[i]
                i += 1
            end
        end
    end

    def get_pairs
        pairs = []
       n = @grid.length * 2
       n.times do 
        pairs << add_value
       end
       pairs.flatten.shuffle!
    end

    def add_value
        values = []
        values << create_values
        values.flatten
    end

    def create_values
        pairs = ""
        valuess = ("A".."Z").to_a
        pairs += valuess.sample * 2
        pairs.split("")
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def show_board
        print "  "
        (0...@grid.length).each {|n| print n.to_s + "|"}
        puts
        i = 0
        print i.to_s + "|"
        @grid.each do |row| 
            row.each do |tile|
                if tile.face_up
                print tile.value.to_s + "|"
                else
                print tile.hide_card.to_s + "|"
                end
            end
            i += 1
            puts
            print i.to_s + "|"
        end
        nil
    end

    def won?
        @grid.all? do |row|
            row.all? {|tile| tile.face_up}
        end
    end
end