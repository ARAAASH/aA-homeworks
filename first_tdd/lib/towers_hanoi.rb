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

  def move
    
  end

end