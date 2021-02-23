require_relative "code"

class Mastermind

    def initialize(length)
        @secret_code = Code.random(length)
    end


    def print_matches(chars)
        print @secret_code.num_exact_matches(chars)
        print @secret_code.num_near_matches(chars)
    end

    def ask_user_for_guess
        print "Enter a code"
        guess1 = gets.chomp
        guess = Code.from_string(guess1)
        print_matches(guess)
        return @secret_code == guess
    end
end 
