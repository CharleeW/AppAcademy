def no_dupes?(arr)
    counts = Hash.new(0)
    arr.each {|ele| counts[ele] += 1}
    counts.select! {|k, v| v == 1}
    counts.keys
end

print no_dupes?([1, 1, 2, 1, 3, 2, 4])
puts
print no_dupes?(['x', 'x', 'y', 'z', 'z'])
puts
print no_dupes?([true, true, true])
puts


def no_consecutive_repeats?(arr)
    (0...arr.length).each {|i| return false if arr[i] == arr[i+1]}
    true

end


print no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
puts
print no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
puts
print no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
puts
print no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
puts
print no_consecutive_repeats?(['x']) 
puts

def char_indices(str)
    hash = Hash.new{|h,k| h[k]=[]}
    str.each_char.with_index {|char, i| hash[char] << i}
    hash
end

print char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
puts
print char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}
puts

def longest_streak(str)
    pairs = get_pairs(str)
    k = pairs.length
    max = []
    return pairs[0] if k == 1
    (0...k-1).each do |i| 
        if pairs[i].length <= pairs[i+1].length
            max = pairs[i+1]
        end
    end
    return max
end

def get_pairs(str)
    pairs = []
    pair = str[0]
    (0...str.length).each do |i| 
        if str[i] == str[i+1]
            pair = pair + str[i]
        else
            pairs << pair
            pair = str[i+1]
        end
    end
    return pairs
end

print longest_streak('a')           # => 'a'
puts
print longest_streak('accccbbb')    # => 'cccc'
puts
print longest_streak('aaaxyyyyyzz') # => 'yyyyy
puts
print longest_streak('aaabbb')      # => 'bbb'
puts
print longest_streak('abc')         # => 'c'
puts

require "prime"
def bi_prime?(num)
    factors = []
    Prime.each(num) do |prime1|
        factors << prime1 if num % prime1
        factors.each do |factor|
            if prime1 * factor == num
                return true
            end
        end
        false
    end
end

print bi_prime?(14)
puts
print bi_prime?(22)
puts
print bi_prime?(25)
puts
print bi_prime?(94)
puts
print bi_prime?(24)
puts
print bi_prime?(64) 
puts

def vigenere_cipher(message, keys)
    str = ""
    i = 0
        message.each_char do |char|
            letter = convert(char, keys[i])
            str += letter
            i += 1
            i %= keys.length
        end
        str
end

def convert(char, num)
    alpha = ("a".."z").to_a

    i = alpha.index(char)
    alpha[(i + num) % 26]
end

puts vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
puts vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
puts vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
puts vigenere_cipher("zebra", [3, 0])            # => "ceerd"
puts vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
rotated = ""
    vowels = "aeiou"

    str.each_char.with_index do |char,i|
        if vowels.include?(char)
            k = i - 1
            completed = false
            while !completed
                if vowels.include?(str[k])
                    rotated += str[k]
                    completed = true
                else
                    k -= 1
                    completed = false
                end
            end
        else
            rotated += char
        end
    end
    rotated
end


puts vowel_rotate('computer')      # => "cempotur"
puts vowel_rotate('oranges')       # => "erongas
puts vowel_rotate('headphones')    # => "heedphanos"
puts vowel_rotate('bootcamp')      # => "baotcomp"

class String

    def select(&prc)
        selected = ""
        prc ||= Proc.new{|ele| return selected}

        self.each_char do |ele|
            if prc.call(ele)
            selected << ele
            end
        end
        selected
    end

    def map!(&prc)
        self.each_char.with_index do |char, i|
            self[i] = prc.call(char, i)
        end
        self
    end

end

p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select

# ---------------------------------------------------------------------
word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"

# ---------------------------------------------------------------------


def multiply(a, b)
    if a == 0 || b == 0
        return 0
    end
    if b < 0 && a > 0
        b + multiply(b,a-1)
    elsif a < 0 && b < 0
        -a + multiply(a,b+1)
    else
        a + multiply(a,b-1)
    end
end

puts multiply(3, 5)        # => 15
puts multiply(5, 3)        # => 15
puts multiply(2, 4)        # => 8
puts multiply(0, 10)       # => 0
puts multiply(-3, -6)      # => 18
puts multiply(3, -6)       # => -18
puts multiply(-3, 6)       # => -18

def lucas_sequence(num)
    return [] if num == 0
    return [2] if num == 1
    return [2,1] if num == 2

    seq = lucas_sequence(num - 1)
    seq << seq[-1] + seq[-2]
    seq
end

print lucas_sequence(0)   # => []
puts
print lucas_sequence(1)   # => [2]    
puts
print lucas_sequence(2)   # => [2, 1]
puts
print lucas_sequence(3)   # => [2, 1, 3]
puts
print lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
puts
print lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]


def  prime_factorization(n)

    return [n] if n < 2 || is_prime?(n)
    factors = []
    (2...n).each do |i|
        if is_prime?(i) && n % i == 0
        factors = prime_factorization(n / i) + [i]
        end
    end
    factors
end

def is_prime?(n)
    (2...n).each { |num| return false if n % num == 0}
    true
end

puts
puts "--------------------------------------------------"
print prime_factorization(12)     # => [2, 2, 3]
puts
print prime_factorization(24)     # => [2, 2, 2, 3]
puts
print prime_factorization(25)     # => [5, 5]
puts
print prime_factorization(60)     # => [2, 2, 3, 5]
puts
print prime_factorization(7)      # => [7]
puts
print prime_factorization(11)     # => [11]
puts
print prime_factorization(2017)   # => [2017]