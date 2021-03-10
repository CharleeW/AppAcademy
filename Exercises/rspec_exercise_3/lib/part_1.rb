def is_prime?(num)
    return false if num < 2
    (2...num).each do |factor|
        return false if num % factor == 0
    end
    true
end

def nth_prime(n)
    numbers = []
    i = 2
    until numbers.length == n
        numbers << i if is_prime?(i)
        i += 1
    end
    numbers[-1]
end

def prime_range(min, max)
    numbers = []
    (min..max).each do |prime|
        numbers << prime if is_prime?(prime)
    end
    numbers
end
