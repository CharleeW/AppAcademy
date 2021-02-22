def hipsterfy(word)
    vowels = "aeiou"
    i = word.length - 1

    while i >= 0
        if vowels.include?(word[i])
            return word[0...i] + word[i+1..-1]
        end
    
    i -= 1
    end
    word
end

def vowel_counts(str)
    vowels = "aeiou"
    my_hash = Hash.new(0)
    str.downcase.each_char do |char|
        if vowels.include?(char)
            my_hash[char] += 1
        end
    end
    my_hash
end

def caesar_cipher(str, num)
    alphabet= "abcdefghijklmnopqrstuvwxyz"
    shift = ""
    str.each_char.with_index do |char, i|
        if alphabet.include?(char)
            i_num = alphabet.index(char)
            spot = (i_num + num) % 26
            shift += alphabet[spot]
        else
            shift += char
        end    
    end
    shift
end

