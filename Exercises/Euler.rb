def multiples_of_3_5(n)
    multiples = []
    (2...n).each do |i|
        if i % 3 == 0 || i % 5 == 0
            multiples << i
        end
    end
    multiples.sum
end

def fibonacci(rangee)
    fibonacci = [1,2]
    c = 1
    while fibonacci.sum < rangee
        fibonacci << fibonacci[c] + fibonacci[c-1]
        c += 1
    end
    fibonacci.select! {|e| e % 2 == 0}.sum
end

p fibonacci(4000000)