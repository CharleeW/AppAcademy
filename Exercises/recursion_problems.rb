#Problem 1: You have array of integers. Write a recursive 
# solution to find the sum of the integers.

def sum_recur(array)
    return array[0] if array.length == 1

    sum_recur(array[0...-1]) + array[-1]
end

p sum_recur([1,4,2,5])
p sum_recur([1,4,-2,5])
p sum_recur([1,5])
p sum_recur([1])

#Problem 2: You have array of integers. Write a recursive 
# solution to determine whether or not the array contains a specific value.


def includes?(array, target)
    return true if array[-1] == target
    return false if array.length == 0 
    includes?(array[0...-1], target)
end

p includes?([1,4,2,5], 3)
p includes?([1,4,-2,5], -2)
p includes?([1,5], 6)
p includes?([1], 3)

# Problem 3: You have an unsorted array of integers. 
# Write a recursive solution to count the number of occurrences of a specific value.

[3,6,2,8,6]
def num_occur(array, target)
    return 0 if array.empty? 
    array[-1] == target ? val = 1 : val = 0

    num_occur(array[0...-1], target) + val
end

p num_occur([3,6,2,8,6], 3)
p num_occur([3,6,2,8,6], 6)
p num_occur([3,6,2,8,6], 2)
p num_occur([3,6,2,8,6,8,8], 8)


# Problem 4: You have array of integers. Write a recursive 
# solution to determine whether or not two adjacent elements of the array add to 12.

def add_to_twelve?(array)

    return false if array.length < 2
    return true if array[0] + array[1] == 12

    add_to_twelve?(array[1..-1])
end

p add_to_twelve?([3,6,2,6,6])
p add_to_twelve?([3,6,3,8,6])
p add_to_twelve?([6,6,2,8,6])
p add_to_twelve?([3,6,2,8,6,4,8])

# Problem 5: You have array of integers. Write a recursive 
# solution to determine if the array is sorted.

def sorted?(array)
    return true if array.length < 2
    array[0] <= array[1] && sorted?(array[1..-1])
end

p "----------------"
p sorted?([3,6,2,6,6])
p sorted?([1,2,3,4,5])
p sorted?([1,2])
p sorted?([2,1])

# Problem 6: Write a recursive function to reverse a string. 
# Don't use any built-in #reverse methods!

def reverse(string)
    return string if string.length < 2
    string[-1] + reverse(string[0...-1])
end

p reverse("hello")
p reverse("shower")
p reverse("lucky")
p reverse("penny")
p reverse("bird")