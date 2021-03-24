puts "-----------------------------------------------Phase 1: Modest problems"
puts "duos"
# Write a method duos that accepts a string as an argument and returns the count 
# of the number of times the same character appears consecutively in the given string.

def duos(str)
    count = 0
    str.each_char.with_index do |char, i|
        if char == str[i+1]
            count += 1
        end
    end
    count
end


# Examples
p duos('bootcamp')      # 1
p duos('wxxyzz')        # 2
p duos('hoooraay')      # 3
p duos('dinosaurs')     # 0
p duos('e')             # 0


puts "sentence_swap"
# Write a method sentence_swap that accepts a sentence and a hash as arguments. The method 
# should return a new sentence where every word is replaced with it's corresponding value in 
# the hash. If a word does not exist as a key of the hash, then it should remain unchanged.

def sentence_swap(sentence, hash)
    words = sentence.split(" ")

    words.map! do |word| 
        if hash.has_key?(word)
            hash[word] 
        else
            word
        end
    end
    words.join(" ")
end

# Examples
p sentence_swap('anything you can do I can do',
    'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
) # 'nothing you shall drink I shall drink'

p sentence_swap('what a sad ad',
    'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
) # 'make a happy ad'

p sentence_swap('keep coding okay',
    'coding'=>'running', 'kay'=>'pen'
) # 'keep running okay'



puts "hash_mapped"
# Write a method hash_mapped that accepts a hash, a proc, and a block. The method 
# should return a new hash where each key is the result of the original key when given to the block. 
# Each value of the new hash should be the result of the original values when passed into the proc.


def hash_mapped(hash, prc, &block)
    updated_hash = Hash.new
    hash.each do |k,v|
        updated_hash[block.call(k)] = prc.call(v)
    end
    updated_hash
end

# Examples
double = Proc.new { |n| n * 2 }
p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

first = Proc.new { |a| a[0] }
p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# {25=>"q", 36=>"w"}


puts "counted_characters"
# Write a method counted_characters that accepts a string as an argument. The method should 
# return an array containing the characters of the string that appeared more than twice. 
# The characters in the output array should appear in the same order they occur in the input string.

def counted_characters(string)
    arr = []
    counts(string).each do |k,v|
        if v > 2
            arr << k
        end
    end

    arr
end

def counts(str)
    counts = Hash.new(0)

    str.each_char do |char|
        counts[char] += 1
    end
    counts 
end

# Examples
p counted_characters("that's alright folks") # ["t"]
p counted_characters("mississippi") # ["i", "s"]
p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
p counted_characters("runtime") # []



puts "triplet_true?"
# Write a method triplet_true? that accepts a string as an argument and returns 
# a boolean indicating whether or not the string contains three of the same character consecutively.

def triplet_true(str)
    duos(str) >= 3
end

# Examples
p triplet_true('caaabb')        # true
p triplet_true('terrrrrible')   # true
p triplet_true('runninggg')     # true
p triplet_true('bootcamp')      # false
p triplet_true('e')             # false



puts "energetic_encoding"
# Write a method energetic_encoding that accepts a string and a hash as arguments. 
# The method should return a new string where characters of the original string are replaced with the 
# corresponding values in the hash. If a character is not a key of the hash, then it 
# should be replaced with a question mark ('?'). Space characters (' ') should remain unchanged.

def energetic_encoding(string, hash)

    string.each_char.with_index do |char,i| 
        if !(char == " ")
            if hash.has_key?(char)
                string[i] = hash[char]
            else
                string[i] = "?"
            end
        end
    end
    string
end

# Examples
p energetic_encoding('sent sea',
    'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
) # 'zimp ziu'

p energetic_encoding('cat',
    'a'=>'o', 'c'=>'k'
) # 'ko?'

p energetic_encoding('hello world',
    'o'=>'i', 'l'=>'r', 'e'=>'a'
) # '?arri ?i?r?'

p energetic_encoding('bike', {}) # '????'



puts "uncompress"
# Write a method uncompress that accepts a string as an argument. The string 
# will be formatted so every letter is followed by a number. The method should 
# return an "uncompressed" version of the string where every letter is repeated 
# multiple times given based on the number that appears directly after the letter.

def uncompress(string)
    new_str = ""
    i = 1
    while i <= string.length - 1
        new_str += string[i-1] * string[i].to_i
        i += 2
    end

    new_str
end

# Examples
p uncompress('a2b4c1') # 'aabbbbc'
p uncompress('b1o2t1') # 'boot'
p uncompress('x3y1x2z4') # 'xxxyxxzzzz'





puts "-----------------------------------------------Phase 2: More difficult, maybe?"
puts "conjunct_select"
# Write a method conjunct_select that accepts an array and one or more procs 
# as arguments. The method should return a new array containing the elements that 
# return true when passed into all of the given procs.

def conjunct_select(arr, *prcs)
    
    arr.select { |n| prcs.all? { |prc| prc.call(n)}}
   
end

# Examples
is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]



puts "convert_pig_latin"
# Write a method convert_pig_latin that accepts a sentence as an argument. 
# The method should translate the sentence according to the following rules:
# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
# if the word begins with a vowel, simply add 'yay' to the end of the word (example: 'eat'->'eatyay')
# if the word begins with a non-vowel, move all letters that come before the word's first vowel to the end of the word and add 'ay' (example: 'trash'->'ashtray')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.

def convert_pig_latin(sentence)
    words = sentence.split(" ")
    vowels = "aeiou"
    words.map! do |word|
        if word.length >= 3
            if vowels.include?(word[0].downcase)
                if word == word.capitalize
                    vowels(word.downcase).capitalize
                else
                    vowels(word.downcase)
                end
            else
                if word == word.capitalize
                nonvowels(word.downcase).capitalize
                else
                nonvowels(word.downcase)
                end
            end
        else
            word
        end
    end
    words.join(" ")
end

def vowels(word)
    word = word + "yay"
    word
end

def nonvowels(word)
    i = 0
    vowels = "aeiou"
    until vowels.include?(word[i])
        i += 1
    end
    word = word[i..-1] + word[0..i-1] + "ay"
end

# Examples
p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

puts "reverberate"
# Write a method reverberate that accepts a sentence as an argument. 
# The method should translate the sentence according to the following rules:
# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
# if the word ends with a vowel, simply repeat the word twice (example: 'like'->'likelike')
# if the word ends with a non-vowel, repeat all letters that come after the word's last vowel, including the last vowel itself (example: 'trash'->'trashash')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.

def reverberate(sentence)
    words = sentence.split(" ")
    vowels = "aeiou"
    words.map! do |word|
        if word.length >= 3
            if vowels.include?(word[-1].downcase)
                if word == word.capitalize
                    repeats_vowels(word.downcase).capitalize
                else
                    repeats_vowels(word.downcase)
                end
            else
                if word == word.capitalize
                repeats_nonvowels(word.downcase).capitalize
                else
                repeats_nonvowels(word.downcase)
                end
            end
        else
            word
        end
    end
    words.join(" ")
end


def repeats_vowels(word)
    word = word + word
end

def repeats_nonvowels(word)
    i = -1
    vowels = "aeiou"
    until vowels.include?(word[i])
        i -= 1
    end
    word = word + word[i..-1]
end

# Examples
p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"


puts "disjunct_select"
# Write a method disjunct_select that accepts an array and one or more procs as 
# arguments. The method should return a new array containing the elements that 
# return true when passed into at least one of the given procs.

def disjunct_select(arr, *prcs)

    arr.select! do |ele|
        prcs.any? { |prc| prc.call(ele)}
    end

end

# Examples
longer_four = Proc.new { |s| s.length > 4 }
contains_o = Proc.new { |s| s.include?('o') }
starts_a = Proc.new { |s| s[0] == 'a' }

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
) # ["apple", "teeming"]

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
    contains_o
) # ["dog", "apple", "teeming", "boot"]

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
    contains_o,
    starts_a
) # ["ace", "dog", "apple", "teeming", "boot"]


puts "alternating_vowel"
# Write a method alternating_vowel that accepts a sentence as an argument. 
# The method should return a new sentence where the words alternate between 
# having their first or last vowel removed. For example:
# the 1st word should be missing its first vowel
# the 2nd word should be missing its last vowel
# the 3rd word should be missing its first vowel
# the 4th word should be missing its last vowel
# ... and so on
# Note that words that contain no vowels should remain unchanged. Vowels are the letters a, e, i, o, u.

def alternating_vowel(sentence)

    words = sentence.split(" ")
    words.map! do |word|
        if words.index(word).even?
            first_vowel(word)
        else
            last_vowel(word)
        end
    end
    words.join(" ")
end

def first_vowel(word)
    vowels = "aeiou"
    word.each_char.with_index do |char,i|
        if vowels.include?(char)
            return word[0...i] + word[i+1..-1]
        end
    end
    word
end

def last_vowel(word)
    vowels = "aeiou"
    i = -1
    while (i * -1) < word.length
        if vowels.include?(word[i])
            if i == -1
                return word[0...i]
            else
                return word[0...i] + word[i+1..-1]
            end
        else
            i -= 1
        end
    end
    word
end

# Examples
p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
p alternating_vowel('code properly please') # "cde proprly plase"
p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"



puts "silly_talk"
# Write a method silly_talk that accepts a sentence as an argument. 
# The method should translate each word of the sentence according to the following rules:
# if the word ends with a vowel, simply repeat that vowel at the end of the word (example: 'code'->'codee')
# if the word ends with a non-vowel, every vowel of the word should be followed by 'b' and that same vowel (example: 'siren'->'sibireben')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.

def silly_talk(sentence)
    vowels = "aeiou"
    words = sentence.split(" ")
    words.map! do |word|
        if vowels.include?(word[-1].downcase)
            if word == word.capitalize
                repeat_vowel(word.downcase).capitalize
            else
                repeat_vowel(word.downcase)
            end
        else
            if word == word.capitalize
                b_vowel(word.downcase).capitalize
            else
                b_vowel(word.downcase)
            end
        end
    end
    words.join(" ")
end

def repeat_vowel(word)
    word = word + word[-1]
end

def b_vowel(word)
    vowels = "aeiou"
    new_word = ""
    word.each_char do |char|
        if vowels.include?(char)
            new_word += char + "b" + char
        else
            new_word += char
        end
    end
    new_word
end



# Examples
p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
p silly_talk('They can code') # "Thebey caban codee"
p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"


puts "compress"
# Write a method compress that accepts a string as an argument. The method 
# should return a "compressed" version of the string where streaks of consecutive 
# letters are translated to a single appearance of the letter followed by the number 
# of times it appears in the streak. If a letter does not form a streak (meaning 
# that it appears alone), then do not add a number after it.

def compress(string)
    new_str = ""
    i = 0
    while i < string.length
        if string[i] == string[i+1]
            new_str += string[i] + counts_h(string, i)[1].to_s
            i = counts_h(string, i)[0]
        else
            new_str += string[i]
            i += 1
        end
    end
    new_str
end

def counts_h(string, i)
    k = i + 1
    c = 1
    until string[i] != string[k]
        c += 1
        k += 1
    end
    return [k, c]
end

# Examples
p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"