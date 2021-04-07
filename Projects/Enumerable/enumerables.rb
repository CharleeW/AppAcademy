class Array

    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        new_arr = []
        self.my_each {|ele| new_arr << ele if prc.call(ele) }
        new_arr
    end

    def my_reject(&prc)
        new_arr = []
        self.my_each {|ele| new_arr << ele if !prc.call(ele) }
        new_arr 
    end

    def my_any?(&prc)
        self.my_each {|ele| return true if prc.call(ele) }
        return false
    end

    def my_all?(&prc)
        self.my_each {|ele| return false if !prc.call(ele) }
        return true
    end

    def my_flatten
        flattened = []
        self.my_each do |ele|
            if ele.is_a?(Array)
                flattened += ele.my_flatten
            else
                flattened << ele
            end
        end
        flattened
    end

    def my_zip(*args)
        new_arr = []

        self.length.times do |i|
            sub_arr = []
            sub_arr << self[i]
            args.my_each do |arg|
                sub_arr << arg[i]
            end
            new_arr << sub_arr
        end
        new_arr
    end

    def my_rotate(r=1)
        if r > 0
            rotate_left(r)
        else
            rotate_right(r)
        end
    end

    def rotate_left(r)
        complete_rotated = self
        r.times do |i| 
            rotated = []
            rotated << complete_rotated[1..-1] 
            rotated << complete_rotated[0]
            complete_rotated = rotated.my_flatten
        end
        complete_rotated
    end

    def rotate_right(r)
        complete_rotated = self
        r *= -1
        r.times do |i| 
            rotated = []
            rotated << complete_rotated[-1]
            rotated << complete_rotated[0...-1] 
            complete_rotated = rotated.my_flatten
        end
        complete_rotated
    end


    def my_join(joiner="")
        joined_string = ""
        self.my_each do |char|
            if self.index(char) != self.length - 1
                joined_string += char
                joined_string += joiner
            else
                joined_string += char
            end
        end
    joined_string
    end

    def my_reverse
        reversed = []

        self.my_each do |ele|
            reversed.unshift(ele)
        end

        reversed
    end

end

return_value = [1, 2, 3].my_each {|num| puts num}.my_each { |num| puts num}
p return_value
puts "============================"
a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []

puts "============================"
a = [1, 2, 3]
p a.my_reject { |num| num > 1 } # => [1]
p a.my_reject { |num| num == 4 } # => [1, 2, 3]

puts "============================"

a = [1, 2, 3]
p a.my_any? { |num| num > 1 } # => true
p a.my_any? { |num| num == 4 } # => false
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true

puts "============================"

p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

puts "============================"

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

puts "============================"

a = [ "a", "b", "c", "d" ]
p a.my_rotate         #=> ["b", "c", "d", "p a"]
p a.my_rotate(2)      #=> ["c", "d", "p a", "b"]
p a.my_rotate(-3)     #=> ["b", "c", "d", "p a"]
p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

puts "============================"

a = [ "a", "b", "c", "d" ]
p a.my_join         # => "abcd"
p a.my_join("$")    # => "a$b$c$d"

puts "============================"

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]