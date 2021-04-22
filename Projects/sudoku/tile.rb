# Tile
# Let's implement a Tile class to represent each 
# position on the Sudoku board. Each Tile has a value 
# and is either given or not. You cannot change the 
# value of any Tile if it was given (that would be 
# cheating!) The game would be incredibly frustrating 
# if we didn't have some way to distinguish given Tiles 
# from non-givens. You'll want to account for this when 
# writing the Tile#to_s method. 

class Tile
    attr_reader :given, :value

    def initialize(value)
        @value = value.to_i #SHOW FONT IN BLACK, MAKE IT SO THAT YOU CANT CHANGE THE VALUE
        @given = @value != 0
    end

    def value=(value)
        @value = value unless @given
    end

end