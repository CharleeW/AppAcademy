class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
  @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
    return true
    else
      return false
    end
  end

  def get_matching_indices(char)
    arr = []
    @secret_word.each_char.with_index do |ele, i|
      if ele == char
        arr << i
      end
    end
    arr
  end

  def fill_indices(char, arr1)
    arr1.each do |i|
      @guess_word[i] = char
    end
  end

  def try_guess(char)
    if already_attempted?(char)
      puts "that has already been attempted"
      return false
    end
    @attempted_chars << char
    arr = get_matching_indices(char)
    if arr.empty?
      @remaining_incorrect_guesses -= 1
    else
      fill_indices(char, arr)
    end
    true
  end


  def ask_user_for_guess
    puts "Enter a char: "
    guess = gets.chomp
    return try_guess(guess)
  end

  def win?
    if @guess_word.join == @secret_word
      puts "WIN"
      return true
    end
      false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    end
    return false
  end

  def game_over?
    if win? || lose?
      puts @secret_word
      return true
    end
    false
  end
end
