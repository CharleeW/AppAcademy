 def partition(arr, number)
    array = [[],[]]
    arr.each do |num|
        if num >= number 
            array[1] << num
        else
            array[0] << num
        end
    end
    array
 end

 def merge(hash1, hash2)
    new_hash = {}
    hash1.each do |key, val|
        new_hash[key] = val
    end
    hash2.each do |key, val|
        new_hash[key] = val   
    end
    new_hash
 end

def censor(sentence, arr)

    censored_sentence = []
    sent = sentence.split(" ")
    sent.each do |word|
        # arr.each do |bad|
        #     if word.downcase == bad.downcase
        #         word = censored(word)
        #     end
        # end
        word = censored(word) if arr.any?{|el| el == word.downcase}
        censored_sentence << word
    end
    censored_sentence.join(" ")
end

def censored(bad_word)
    vowels = "aeiou"
    new_word = ""
    bad_word.each_char do |char|
        if vowels.include?(char.downcase)
            char = "*"
        end
        new_word += char
    end
    new_word
end

def power_of_two?(num)
    if num == 1
        return true
    end
    run = false
    while !run
        run = true
        if num == 2
            return true
        end
        if num % 2 != 0 
            return false
        else
            num = num / 2
            run = false
        end
    end
true
end