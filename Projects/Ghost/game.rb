require_relative "players.rb"
require "Set"

class Game

    def initialize(dic, *players)
        @players = players
        @current_player = @players[0]
        @fragment = ""
        @dictionary = Set.new(dic)
    end

    def add_player(player)
        @players << player
    end

    def valid_play?(turn)
        alphabet = "abcdefghijklmnopqrstuvwxyz"
        alphabet.include?(turn) && dictionary_valid?(turn)
    end

    def dictionary_valid?(turn)
        @dictionary.keys.any? { |key| key.starts_with?(turn)}
    end

    def lose?
        @dictionary.include?(fragment) || !dictionary_valid(fragment)
    end

    def run
        until self.lose?
        guess = @current_player.get_guess
        @fragment += guess
        self.switch_player
        end
    end

end