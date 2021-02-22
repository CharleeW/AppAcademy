require "byebug"

def select_even_nums(arr)
arr.select(&:even?)
end

def reject_puppies(arr)
    arr.reject { |hash| hash["age"] < 3 }
end

def count_positive_subarrays(arr)
    arr.count {|subarr| subarr.sum > 0}
end

def aba_translate(str)
    tformed = ""
    str.each_char { |char| tformed += (("aeiou").include?(char) ? char + "b" + char : char) }
    tformed
end

def aba_array(arr)
    arr.map {|translate| aba_translate(translate)}
end