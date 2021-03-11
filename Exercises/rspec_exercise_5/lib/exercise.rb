def zip(*args)
    num_rows = args[0].length
    matrix = []

    (0...num_rows).each do |i|
        arrays = []
        args.each do |arg|
            arrays << arg[i]
        end
        matrix << arrays
    end
matrix
end

def prizz_proc(arr, prc1, prc2)
    new_arr = []
    arr.each do |ele| 
        if !prc1.call(ele) && prc2.call(ele)
            new_arr << ele
        elsif 
            prc1.call(ele) && !prc2.call(ele)
            new_arr << ele
        end
    end 
    new_arr
end

def zany_zip(*args)
    max = maximum(args) { |w| w.length}
    num_rows = max.length
    matrix = []

    (0...num_rows).each do |i|
        arrays = []
        args.each do |arg|
            arrays << arg[i]
        end
        matrix << arrays
    end
    matrix  
end

def maximum(arr, &prc)
    return nil if arr.empty?
    max = arr[0]

    arr.each.with_index do |ele, i|
        max = ele if prc.call(ele) >= prc.call(max)
    end
    max
end

def my_group_by(arr, &prc)
    groups = Hash.new{ |h,k| h[k] = []}

    arr.each do |ele|
        groups[prc.call(ele)] << ele
    end
    groups
end

def max_tie_breaker(arr, prc1, &prc)
    return nil if arr.empty?
    max = arr[0]

    arr.each do |ele|
        if prc.call(ele) > prc.call(max)
            max = ele
        elsif prc.call(ele) == prc.call(max)
            if prc1.call(ele) > prc1.call(max)
                max = ele
            end
        end
    end
    max
end

def silly_syllables(sent)
    sentence = []
    vowels = "aeiou"
    sent.split(" ").each_with_index do |word, i|
        count = 0
        word.each_char do |char1|
            if vowels.include?(char1)
                count += 1
            end
        end
        if count < 2
            sentence << word 
        else
            sentence << scramble(word)
        end
    end
    sentence.join(" ")
end

def scramble(word)
    scramword = ""
    vowels = "aeiou"
    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            scramword = word[i..-1] 
            break
        end
    end
    k = -1
    until vowels.include?(word[k])
        k -= 1
    end

    scramword[0..k]
end