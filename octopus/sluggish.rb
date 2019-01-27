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

# tiles_array = ["up", "right-up", "right",
#  "right-down", "down", "left-down", "left",  
#  "left-up" 
# ]
def slow_dance(dir, tiles_array)
  tiles_array.each_with_index do |tile, i|
    return i if tile == dir
  end
end
p slow_dance("left-down", ["up", "right-up", "right",
 "right-down", "down", "left-down", "left",  
 "left-up" 
])

# constant octopus dance
#use a hash for constant lookup
tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end

p fast_dance('down', tiles_hash)


