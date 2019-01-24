class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1, @name2 = name1, name2
    @cups = []
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    14.times do |i|
      cup = []
      4.times do |j|
        cup << :stone
      end
      if (i == 6) || (i == 13)
        @cups << []
      else
        @cups << cup
      end
    end
  end

  def valid_move?(start_pos)
    if !start_pos.between?(0,13)
      raise "Invalid starting cup"
    elsif @cups[start_pos].empty?
      raise "Starting cup is empty"
    end
    true
  end
  
  def make_move(start_pos, current_player_name)
    stones = []
    if valid_move?(start_pos)
      l = @cups[start_pos].length
      @cups[start_pos].delete(:stone)
      l.times {|i| stones << :stone}

    end
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
