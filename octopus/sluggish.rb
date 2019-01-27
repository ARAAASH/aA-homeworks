require 'byebug'
# takes O(n^2)
def sluggish_octopus(array)
  res = ""
  array.each_with_index do |first, i|
    res = first
    array.each_with_index do |second, j|
      next if i == j
      res = second if second.length > res.length
     
    end
  end
  res
end

class Array
  
  def merge_sort(&proc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if self.length <= 1

    mid = self.length / 2

    left = self.take(mid).merge_sort(&proc)
    right = self.drop(mid).merge_sort(&proc)
    Array.merge(left,right,&proc)

  end
  
  private
  def self.merge(left, right, &proc)
    merged = []
    until left.empty? || right.empty?
      case proc.call(left.first, right.first)
      when 1
        merged << right.shift
      when 0
        merged << left.shift
      when -1
        merged << left.shift
      end
    end
    merged.concat(left)
    merged.concat(right)
    merged
  end
end

def dominant_octopus(array)
  prc = Proc.new{ |x,y| y.length <=> x.length }
  array.merge_sort(&prc)[0]
end

def clever_octopus(array)
  longest = array[0]
  array.each do |ele|
    longest = ele if ele.length > longest.length
  end
  longest
end


