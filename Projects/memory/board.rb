# The Board is responsible for keeping track of 
# all your Cards. You'll want a grid instance variable 
# to contain Cards. Useful methods:

# #populate should fill the board with a set of 
# shuffled Card pairs
# #render should print out a representation of the Board's current state
# #won? should return true if all cards have been revealed.
# #reveal should reveal a Card at guessed_pos (unless 
# it's already face-up, in which case the method should do nothing). 
#     It should also return the value of the card it revealed (you'll see why later).
# Parallel Assignment
# In Ruby you can declare and assign multiple variables at once 
# using commas to separate multiple variables and values. For example,

# x, y, z = 1, 2, 3 # x = 1, y = 2, z = 3
# And if there's not the same number of variables and values?

# x, y = 1, 2, 3 # x = 1, y = 2, 3 is not assigned
# a, b, c = 10, 20 # a = 10, b = 20, c = nil
# When there are multiple variables assigned to an array, 
# Ruby expands the array so that each element becomes its own value! For example,

# x, y, z = [1, 2, 3] # x = 1, y = 2, z = 3
# a, b, c = [10, 20] # a = 10, b = 20, c = nil
# This is very helpful to use when writing [](pos) and []=(pos, value) 
# for your Board to access row and col. Because the pos exists as an array, 
#     it's better to pass it as an array in a method call, relying on the 
#     method to index the array.

require_relative "card.rb"
class Board
    attr_reader :grid

    def initialize(size)
        @grid = Array.new(size) {Array.new(size) {Card.new}}
    end

    def [](n,k)
        @grid[n][k]
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
                print tile.hide_cards.to_s + "|"
                end
            end
            i += 1
            puts
            print i.to_s + "|"
        end
        nil
    end

    def won?
        @grid.each do |row|
            row.each {|tile| return false if !tile.face_up}
        end
    end
end