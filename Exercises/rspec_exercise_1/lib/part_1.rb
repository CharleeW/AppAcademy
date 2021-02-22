def average(num1, num2)
    return (num1 + num2) / 2.0
end

def average_array(arr)
    average = arr.sum / arr.length.to_f
    return average
end

def repeat(str, num)
    str * num
end

def yell(str)
    yelled = str.upcase + "!"
    yelled
end

def alternating_case(str)
    sentance = str.split(" ")
    new = []
    sentance.each.with_index do |word, inx| 
        if inx % 2 == 0 
            new << word.upcase
        else
            new << word.downcase
        end
    end
    new.join(" ")
end