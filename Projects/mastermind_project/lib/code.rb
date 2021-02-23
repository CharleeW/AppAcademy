class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
    chars.each do |char|
      return false if !POSSIBLE_PEGS.has_key?(char.upcase)
    end
    return true
  end

  def initialize(chars)
    chars.map!(&:upcase)
    raise "does not contain valid pegs" if !self.class.valid_pegs?(chars)
    @pegs = chars
  end

  def self.random(length)
    random_chars = Array.new(length) { POSSIBLE_PEGS.keys.sample }
    random = Code.new(random_chars)
  end

  def self.from_string(str_pegs)
    Code.new(str_pegs.split(""))
  end

  def [](number)
    @pegs[number]
  end

  def length
    @pegs.length
  end

  #Part 2 ------------------------------------------

  def num_exact_matches(guess)
    count = 0
    guess.pegs.each.with_index { |char, i| count += 1 if char == @pegs[i] }
    count
  end

  def num_near_matches(guess)
    count = 0
    guess.pegs.each.with_index do |char, i| 
      if char == @pegs[i]
        count += 0 
      else
        if @pegs.include?(char)
          count += 1 
        end
      end
    end
    count
  end

  def ==(other_code)
    return false if other_code.pegs.length != @pegs.length
    if other_code.pegs == @pegs
      true
      else
        false
    end
  end

end
