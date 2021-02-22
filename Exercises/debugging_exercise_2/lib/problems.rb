# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def largest_prime_factor(num)
    (2..num).reverse_each { |factor| return factor if num % factor == 0 && prime?(factor)}
end

def prime?(factor)
    (2...factor).each { |factor1| return false if factor % factor1 == 0}
    true
end



def unique_chars?(string)

    string.each_char.with_index do |char, i|
        (i+1...string.length).each { |j| return false if char == string[j]}
    end
    true
end

def dupe_indices(array)
    hash = Hash.new(Array.new)
    
        array.each_with_index do |letter, i|
            hash[letter] += [i]
        end

        new_hash = hash.select {|k,v| v.length > 1}

    new_hash
end


def ana_array(arr1, arr2)
    if arr1.length > arr2.length
        big = arr1
        small = arr2
    else
        big = arr2
        small = arr1
    end
    big.each do |word|
        return false if !small.include?(word)
    end
     
    true

end

