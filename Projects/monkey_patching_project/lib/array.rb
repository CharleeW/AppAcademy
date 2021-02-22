# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.length < 1
    return self.max - self.min 
  end

  def average
    return nil if self.length < 1
    return (self.sum * 1.0) / self.length
  end

  def median
    return nil if self.length < 1
    sorted = self.sort 
    long = self.length
    mid = long / 2
    if long % 2 == 0
        return (sorted[mid] + sorted[mid-1]) / 2.0
    else
        return sorted[mid]
    end
  end

  def counts
    counted = Hash.new(0)
    self.each { |ele| counted[ele] += 1}
    return counted
  end

  def my_count(num)
    count = 0
    self.each {|ele| count += 1 if ele == num}
    return count
  end

  def my_index(num)
    self.each_with_index {|ele, i| return i if num == ele}
    nil
  end

  def my_uniq
    new_arr = Hash.new(0)
    self.each { 
        |ele| new_arr[ele] += 1}
    new_arr.keys
  end

  def my_transpose
    size = self.length
    new_arr = Array.new(size){Array.new(size)}
    i = 0
    while i < size
        j = 0
        while j < size
            new_arr[j][i] = self[i][j]
            j += 1
        end
        i += 1
    end
    new_arr
  end

end


