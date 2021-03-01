# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    if num_1 > num_2
        max = num_1
        min = num_2
    else
        max = num_2
        min = num_1
    end
    i = 2
    while i > 0
        if max % min == 0
            return max
        else
            max *= i
        end
    end
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    counts = Hash.new(0)
    i = 0
    while i < str.length
        counts[str[i..i+1]] += 1
        i += 1
    end
    pair = counts.select {|k,v| v == counts.values.max}.keys
    pair[0]
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        swapped = Hash.new
        self.each {|k,v| swapped[v] = k}
        swapped
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        self.each_with_index do |first, i|
            self[i..-1].each do |second|
                if first + second == num
                    count +=1
                end
            end
        end
        count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)

        prc ||= Proc.new {|num1, num2| num1 <=> num2}

        sorted = false

        while !sorted
            sorted = true
            (0...self.length - 1).each do |num|
                if prc.call(self[num], self[num+1]) > 0
                    self[num], self[num+1] = self[num+1], self[num]
                    sorted = false
                end
            end
        end
        self
    end
end
