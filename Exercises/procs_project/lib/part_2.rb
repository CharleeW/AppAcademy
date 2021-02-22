require "byebug"

def reverser(str, &prc)
    return prc.call(str.reverse)
end

def word_changer(str, &prc)
    new = []
    str.split(" ").each { |word| new << prc.call(word)}
    new.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    if prc1.call(num) > prc2.call(num)
        return prc1.call(num)
    else
        return prc2.call(num)
    end
end

def and_selector(arr, prc1, prc2)
    new = []
    arr.each do |num|
        new << num if prc1.call(num) && prc2.call(num)
    end
    new
end

def alternating_mapper(arr, prc1, prc2)
    new = []
    arr.each_with_index do |num, i|
        if i.even?
        new << prc1.call(num)
        else
        new << prc2.call(num)
        end
    end
    new
end