require "byebug"

def all_words_capitalized?(arr)
    arr.all? {|word| word.capitalize == word}
end

def no_valid_url?(url)
    types = ['com', 'net', 'io', 'org']
    
    url.none? do |site| 
        half = site.split(".")
        types.include?(half[1])
    end
end

def any_passing_students?(arr)

    arr.any? {|ele| (ele[:grades].sum) / (ele[:grades].length) >= 75 }
end
