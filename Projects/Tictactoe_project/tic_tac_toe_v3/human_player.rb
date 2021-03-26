
class HumanPlayer
    attr_reader :mark
    
    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        position = nil
        while position == nil
            puts "Enter two numbers representing a position in the format row, col"
            puts "Example: 0 2"
            position = gets.chomp.split(" ")
            position.map! {|n| n.to_i}
            if !(legal_positions.include?(position))
                puts position.to_s + "this is an illegal position, enter another position"
                position = nil
            end
        end
        position
    end

end