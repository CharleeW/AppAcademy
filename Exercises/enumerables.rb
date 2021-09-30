# class Array

#     def my_each(&prc)
#         i = 0
#         while i < self.length 
#             prc.call(self[i])
#             i += 1
#         end
#         self
#     end

#     def my_select(&prc)
#         chosen = []
#         self.my_each {|ele| chosen << ele if prc.call(ele)}      
#         chosen
#     end

#     def my_reject(&prc)
#         chosen = []
#         self.my_each {|ele| chosen << ele if !(prc.call(ele))}
#         chosen
#     end

#     def my_any?(&prc)
#         self.my_each {|ele| return true if prc.call(ele)}
#         false
#     end

#     def my_all?(&prc)
#         self.my_each {|ele| return false if !(prc.call(ele))}
#         true
#     end

#     def my_flatten
#         if self.length <= 1
#             if self[0].is_a?(Array)
#                 return self[0].my_flatten
#             else
#                 return self
#             end
#         end

#         [self[0]].my_flatten + self[1..-1].my_flatten
#     end
# end

# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end

# p return_value 

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]


# p a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten

# ------------------------------------------------------------------------------
# My Zip
# Write my_zip to take any number of arguments. 
# It should return a new array containing self.length elements. 
# Each element of the new array should be an array with a length of 
# the input arguments + 1 and contain the merged elements at that index. 
# If the size of any argument is less than self, nil is returned for that location.

class Array

    def my_zip(*args)
        new_arr = Array.new(self.length) {Array.new(args.length + 1)}
        arrays = [self] + args

        i = 0
        k = 0
        arrays.each do |arr|
            arr.each do |ele|
                if i < self.length
                    new_arr[i][k] = ele
                    i += 1
                else
                    break
                end
            end
            i = 0
            k += 1
        end

        new_arr
    end

end

# # Example:
a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# # # My Rotate
# # # Write a method my_rotate that returns a new array containing 
# # # all the elements of the original array in a rotated order. 
# # # By default, the array should rotate by one element. If a negative 
# # # value is given, the array is rotated in the opposite direction.

# class Array

# def my_rotate(n=1)
#     n_arr = self
#     if n > 0
#         n.times do 
#             n_arr = n_arr[1..-1] + [n_arr[0]]
#         end
#     else
#         absn = n.abs
#         absn.times do 
#             n_arr = [n_arr[-1]] + n_arr[0...-1]
#         end
#     end
#     n_arr
# end

# end

# # # # Example:

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# # # My Join
# # # my_join returns a single string containing all the elements of 
# # # the array, separated by the given string separator. If no 
# # # separator is given, an empty string is used.


# class Array

#     def my_join(n="")
#         joined = ""
#         i = 0 
#         while i < self.length - 1
#             joined += self[i] + n
#             i += 1
#         end

#         joined += self[-1]
#     end

# end
# # # Example:

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

# # # My Reverse
# # # Write a method that returns a new array containing all the
# # #  elements of the original array in reverse order.

# class Array

# def my_reverse
#     reversed = []

#     self.each do |ele|
#         reversed = [ele] + reversed
#     end

#     reversed
# end

# end

# # # Example:

# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]