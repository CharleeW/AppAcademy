def proper_factors(num)
    new_arr = []
    (1...num).each do |nums|
        new_arr << nums if num % nums == 0
    end
    new_arr
end

def aliquot_sum(num)
    added = proper_factors(num).sum
end

def perfect_number?(num)
    return true if num == aliquot_sum(num)
    false
end

def ideal_numbers(n)
    arr = []
    i = 1
    until arr.length == n
        arr << i if perfect_number?(i)
        i += 1
    end
    arr
end 
