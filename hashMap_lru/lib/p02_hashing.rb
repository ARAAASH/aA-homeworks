class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    sum_ascii = 0
    self.each_with_index do |ele, i|
      if ele.is_a?(String)
        sum_ascii += get_ascii(ele, i)
      else
        sum_ascii += get_ascii(ele.to_s, i)
      end
    end

    sum_ascii ^ 255
  end

  def get_ascii(str, i)
    ascii_num = 0
    str.each_char do |c|
      ascii_num += c.ord * i
    end
    ascii_num
  end
end

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
