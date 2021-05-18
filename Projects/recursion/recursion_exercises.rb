# Warmup
# Write a recursive method, range, that takes a start and an end and 
# returns an array of all numbers in that range, exclusive. For example, 
# range(1, 5) should return [1, 2, 3, 4]. If end < start, you can return an empty array.
# Write both a recursive and iterative version of sum of an array.

def i_range(startt, endd)
    range = []
    while startt < endd
        range << startt
        startt += 1
    end
    range
end

def r_range(start, endd)
    return [] if endd <= start
    [start] + r_range((start + 1), endd)

end

p i_range(1, 10)
p r_range(1, 10)


# --------------------------------------------------Exponentiation
# Write two versions of exponent that use two different recursions:
# # this is math, not Ruby methods.

# # recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

def exp_1(b, n)
    return 1 if n == 0
    b * exp_1(b, n - 1)
end

p exp_1(2,4)

# # recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]
# Note that for recursion 2, you will need to square the results 
# of exp(b, n / 2) and (exp(b, (n - 1) / 2). Remember that you don't 
# need to do anything special to square a number, just calculate the 
#     value and multiply it by itself. So don't cheat and use exponentiation 
#     in your solution.

def exp_2(b, n)
    return 1 if n == 0
    return b if n == 1
    if n % 2 == 0
        exp_2(b, n / 2) ** 2 
    else
        b * (exp_2(b, (n - 1) / 2) ** 2)
    end
end

p exp_2(0,0)
p exp_2(0,1)
p exp_2(1,0)
p exp_2(15,10)
p exp_2(10,2)
p exp_2(2,5)
p exp_2(2,1)
p exp_2(2,2)


# -------------------------------------------------Deep dup
# The #dup method doesn't make a deep copy:

# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# robot_parts_copy = robot_parts.dup

# # shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# # but it does
# robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]
# When we dup an Array, it creates a new array to hold the elements, but doesn't 
# recursively dup any arrays contained therein. So the dup method creates one new 
# array, but just copies over references to the original interior arrays.

# Sometimes you want a shallow dup and sometimes you want a deep dup. Ruby keeps 
# things simple by giving you shallow dup, and letting you write deep dup yourself.

# Using recursion and the is_a? method, write an Array#deep_dup method that will 
# perform a "deep" duplication of the interior arrays.

# Note: For simplicity's sake, we are only going to ensure the deep duplication of 
# arrays. Don't worry about deep-duping (or regular-duping) other types of mutable 
# objects (like strings, hashes, instances of custom classes, etc.), since this would 
# require that we implement a deep dup method for each of those classes, as well.

# It's okay to iterate over array elements using the normal each for this one :-)

# You should be able to handle "mixed" arrays. For instance: [1, [2], [3, [4]]].

# -------------------------------------------------Fibonacci
# Write a recursive and an iterative Fibonacci method. The method should take in 
# an integer n and return the first n Fibonacci numbers in an array.

# You shouldn't have to pass any arrays between methods; you should be able to do 
#     this just passing a single argument for the number of Fibonacci numbers requested.

def fibonacci(n)
    return 1 if n == 1 || n == 2
    fibonacci(n-2) + fibonacci(n-1)
end

p "------------------------------------------"
p fibonacci(5)
p fibonacci(4)
p fibonacci(3)
p fibonacci(2)
p fibonacci(1)




# -------------------------------------------------Binary Search
# The binary search algorithm begins by comparing the target value to the value of 
# the middle element of the sorted array. If the target value is equal to the middle 
# element's value, then the position is returned and the search is finished. If the 
# target value is less than the middle element's value, then the search continues on 
# the lower half of the array; or if the target value is greater than the middle 
# element's value, then the search continues on the upper half of the array. This 
# process continues, eliminating half of the elements, and comparing the target value 
# to the value of the middle element of the remaining elements - until the target 
# value is either found (and its associated element position is returned), or until 
# the entire array has been searched (and "not found" is returned).

# Write a recursive binary search: bsearch(array, target). Note that binary search 
# only works on sorted arrays. Make sure to return the location of the found 
# object (or nil if not found!). Hint: you will probably want to use subarrays.

def bsearch(array, target)
    return nil if array.empty?
    m = array.length / 2
    return m if array[m] == target 
    if array[m] > target
        return bsearch(array[0...m], target)
    else
        ele = bsearch(array[m+1..-1], target)
        if ele == nil 
            return nil 
        else
            return (m + 1) + bsearch(array[m+1..-1], target)
        end
    end
    
end
p "-------------------------------------"
# Make sure that these test cases are working:
p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


# -------------------------------------------------Merge Sort
# Implement a method merge_sort that sorts an Array:

# The base cases are for arrays of length zero or one. Do not use a length-two 
# array as a base case. This is unnecessary.
# You'll want to write a merge helper method to merge the sorted halves.
# To get a visual idea of how merge sort works, watch this gif and check out this diagram.

def merge_sort(array)
    return array if array.length == 0 || array.length == 1

    mid = array.length / 2
    first_half = array[0...mid]
    second_half = array[mid..-1]
    merge(merge_sort(first_half), merge_sort(second_half))
end

def merge(left, right)
    merged = []
    while !(left.empty?) && !(right.empty?)
        if left.first < right.first
            merged << left.first
            left.shift
        else
            merged << right.first
            right.shift
        end
    end
    merged + left + right
end

p "=============="
p merge_sort([2,1,4,7,9,10,3])


# -------------------------------------------------Array Subsets
# Write a method subsets that will return all subsets of an array.

# subsets([]) # => [[]]
# subsets([1]) # => [[], [1]]
# subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# subsets([1, 2, 3])
# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
# You can implement this as an Array method if you prefer.

# Hint: For subsets([1, 2, 3]), there are two kinds of subsets:

# Those that do not contain 3 (all of these are subsets of [1, 2]).
# For every subset that does not contain 3, there is also a corresponding subset 
# that is the same, except it also does contain 3.





# -------------------------------------------------Permutations
# Write a recursive method permutations(array) that calculates all the permutations 
# of the given array. For an array of length n there are n! different permutations. 
# So for an array with three elements we will have 3 * 2 * 1 = 6 different permutations.

# permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
#                         #     [2, 1, 3], [2, 3, 1],
#                         #     [3, 1, 2], [3, 2, 1]]
# You can use Ruby's built in Array#permutation method to get a better 
# understanding of what you will be building.

# [1, 2, 3].permutation.to_a  # => [[1, 2, 3], [1, 3, 2],
#                             #     [2, 1, 3], [2, 3, 1],
#                             #     [3, 1, 2], [3, 2, 1]]
# -------------------------------------------------Make Change
# RubyQuiz: Make change.

# Here's a game plan for solving the problem:

# First, write a 'greedy' version called greedy_make_change:

# Take as many of the biggest coin as possible and add them to your result.
# Add to the result by recursively calling your method on the remaining amount, 
# leaving out the biggest coin, until the remainder is zero.
# Once you have a working greedy version, talk with your partner about refactoring 
# this to make_better_change. What's wrong with greedy_make_change?

# Consider the case of greedy_make_change(24, [10,7,1]). Because it takes as many 
# 10 pieces as possible, greedy_make_change misses the correct answer of [10,7,7] (try it in pry).

# To make_better_change, we only take one coin at a time and never rule out 
# denominations that we've already used. This allows each coin to be available 
# each time we get a new remainder. By iterating over the denominations and continuing 
# to search for the best change, we assure that we test for 'non-greedy' uses of each denomination.

# Discuss the following game plan and then work together to implement your new method:

# Iterate over each coin.
# Grab only one of that one coin and recursively call make_better_change on the remainder 
# using coins less than or equal to the current coin.
# Add the single coin to the change returned by the recursive call. This will be a possible 
# solution, but maybe not the best one.
# Keep track of the best solution and return it at the end.
# N.B. Don't generate every possible permutation of coins and then compare them. Remember 
# that a permutation is not the same thing as a combination - we will need to check 
# every combination of coins that add up to our target, we just don't want to check 
# the same combination in different orders. If you get stuck you can start by writing 
# a solution that calculates and compares all of the permutations without storing 
# them in an array. Then go back and refactor your solution so that it only calculates 
# and compares all of the different combinations. If you and your partner get totally stuck, 
# or would like to compare your answer, feel free to reference this video walkthrough of the problem.

# Make sure you and your partner understand each line before moving on.