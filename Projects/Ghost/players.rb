
class Player
    attr_reader :name
    attr_accessor :losses

    def initialize(name)
        @name = name
        @losses = 0
    end

    def get_guess
        guess = nil
        until valid_guess?(guess)
            puts "Please enter a valid letter"
            guess = gets.chomp
        end
        guess
    end

    def valid_guess?(guess)
        return false if guess.nil?
        alphabet = "abcdefghijklmnopqrstuvwxyz"
        alphabet.include?(guess)
    end


end