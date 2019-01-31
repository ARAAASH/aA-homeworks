require "byebug"
class Map
    def initialize
        @map = Array.new(){[]}
    end

    def get(key)
        @map.each do |m|
            return m[1] if m[0] == key
        end
    end

    def set(key, value)
        # byebug
        update = false
        if map.empty? 
            @map << [key, value] 
        else
            map.each do |m|
                # byebug
                if m[0] == key 
                    m[1] = value
                    update = true
                end
            end
            @map << [key, value] if !update
        end 
    end

    def delete(key)
        @map.each do |m|
            if m[0] == key 
                @map.delete([key, m[1]])
            end
        end
    end
    attr_reader :map 
end

m = Map.new
p m.set(2,3)
# p m.map
 p m.set(4,3)
#  byebug
 p m.set(2,5)
#  p m.map
  p m.set(4,9)
p m.map
 p m.get(2)
 p m.delete(4)