 def my_reject(arr, &prc)
    new = []
    arr.each { |ele| new << ele if !prc.call(ele)}
    new
 end

 def my_one?(arr, &prc)
    count = 0
    arr.each { |ele| count += 1 if prc.call(ele) }
    return true if count == 1
    false
 end

 def hash_select(hash, &prc)
    new_hash = Hash.new(0)

    hash.each do |k,v|
        new_hash[k] = v if prc.call(k,v)
    end

    new_hash
 end

 def xor_select(arr, prc1, prc2)
    new_arr = []
    arr.each do |ele| 
        if prc1.call(ele) && !prc2.call(ele)
            new_arr << ele
        elsif 
            !prc1.call(ele) && prc2.call(ele)
            new_arr << ele
        end
    end
    new_arr
 end

 def proc_count(value, arr)
    count = 0
    arr.each { |prcs| count += 1 if prcs.call(value) }
    count
 end

