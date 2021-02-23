require_relative "code"

class Mastermind

    def initialize(length)
        @secret_code = Code.random(length)
    end


    def print_matches(chars)
        puts "exact matches: " + @secret_code.num_exact_matches(chars).to_s
        puts "near matches: " + @secret_code.num_near_matches(chars).to_s
    end

    def ask_user_for_guess
        puts "Enter a code "
        guess1 = gets.chomp
        guess = Code.from_string(guess1)
        print_matches(guess)
        return @secret_code == guess
    end
end 
