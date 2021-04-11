require_relative "players"
# require "Set"

class Game
    attr_reader :fragment, :current_player, :players, :previous_player
    attr_accessor :fragment


    def initialize(*players)
        @players = players.map! {|player| Player.new(player)}
        @current_player = @players[0]
        @previous_player = nil
        @fragment = ""
        words = File.readlines("words.txt").map(&:chomp)
        @dictionary = Set.new(words)
    end

    def players
        @players.map {|player| player.name}
    end

    def dictionary_valid?(turn)
        @dictionary.any? { |key| key.start_with?(turn)}
    end

    def lose?
        @dictionary.include?(@fragment) || !dictionary_valid?(@fragment)
    end

    def switch_player
        @players.rotate!
        @current_player = @players[0]
    end


    def run
        until @players.length == 1
            self.round
        end

        puts @current_player.name + " You Win!!!!"
    end

    def round
        puts "New Round "
        until self.lose?
            puts "Fragment = " + @fragment.to_s
            puts "Enter a letter guess , " + self.current_player.name.to_s.capitalize + ":"
            guess = self.current_player.get_guess
            @fragment += guess
            puts "=============================="
            @previous_player = @current_player
            self.switch_player
        end
        self.set_up_next_round
    end

    def set_up_next_round
        @fragment = ""  
        @previous_player.losses += 1
        puts @previous_player.name.to_s + "'s remaining chances - " + "GHOST"[0...@previous_player.losses]
        if @previous_player.losses == 5
            puts @previous_player.name.to_s + " You're out!"
            @players.delete(@previous_player)
        end
    end
end