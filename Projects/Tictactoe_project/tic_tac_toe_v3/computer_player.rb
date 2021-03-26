class ComputerPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        position = legal_positions.sample
        print "Computer -" + @mark.to_s + " chose position " + position.to_s
        position
    end

end