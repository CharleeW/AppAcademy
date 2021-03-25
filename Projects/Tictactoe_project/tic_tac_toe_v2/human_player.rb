
class HumanPlayer
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        puts "Next player, enter two numbers representing a position in the format row, col"
        puts "Example: 0 2"
        position = gets.chomp.split(" ")
        raise "not a valid position" if position.length != 2
        position.map! {|n| n.to_i}
    end

end