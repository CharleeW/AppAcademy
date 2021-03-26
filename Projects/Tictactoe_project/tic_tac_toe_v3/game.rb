require_relative "board.rb"
require_relative "human_player.rb"
require_relative "computer_player.rb"

class Game

    def initialize(n, hash)
        @players = []
        hash.each do |k,v| 
            if v
                @players << ComputerPlayer.new(k)
            else
                @players << HumanPlayer.new(k)
            end
        end
        @board = Board.new(n)
        @current_player = @players[0]
    end

    def switch_turn
        @players.rotate!
        @current_player = @players[0]
    end

    def play
        while @board.empty_positions?
            @board.print
            possible_positions = @board.legal_positions
            @board.place_mark(@current_player.get_position(possible_positions), @current_player.mark)
            if @board.win?(@current_player.mark)
                @board.print
                print "Player - " +  @current_player.mark.to_s
                puts
                print "You won! Clear board to play again"
                return
            else
                switch_turn
            end
        end
        print "No one wins, Clear board to play again"
        return
    end

end