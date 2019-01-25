class TowersHanoi
  attr_reader :rod1, :rod2, :rod3, :rod4
  def initialize(rod1)
    @rod1 = rod1
    @rod2 = []
    @rod3 = []
    @rod4 = []
  end

  def prompt
    loop do
      puts "what pile to select from?"
      start_rod = gets.prompt.to_i
      move
      puts "where to put it?"
      end_rod = gets.prompt.to_i
      break if won?
    end
  end

  def move(start_rod, end_rod)
    hsh = {}
    hsh[1] = @rod1
    hsh[2] = @rod2
    hsh[3] = @rod3
    hsh[4] = @rod4

    ele = hsh[start_rod].pop
    hsh[end_rod].push(ele)

  end

  def won?(end_rod)
    hsh = {}
    hsh[1] = @rod1
    hsh[2] = @rod2
    hsh[3] = @rod3
    hsh[4] = @rod4
    hsh[end_rod].length == 4 && hsh[end_rod].sort.reverse == [4,3,2,1]
    
  end

end