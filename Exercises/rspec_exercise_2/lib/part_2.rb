def palindrome?(str)

    first = 0
    last = str.length - 1
    while first < last
        return false if str[first] != str[last]
        last -= 1
        first += 1
    end
    true
end

def substrings(str)
    subs = []
    (0...str.length).each do |start|
        (start...str.length).each do |last|
            subs << str[start..last]
        end
    end
    subs
end

def palindrome_substrings(words)
    yup = []
    arrays = substrings(words)
    arrays.each do |part|
        if part.length > 1
            yup << part if palindrome?(part)
        end
    end
    yup
end