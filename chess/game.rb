require_relative "board"
require_relative "display"
require_relative "player"
require_relative "humanPlayer"

class Game
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @player1 
    @player2
    @curr_player
    set_players
    play
  end

  def set_players
    puts "Pick a color: red or blue?"
    input = gets.chomp 
    @player1 = HumanPlayer.new(input.to_sym, @display)
    puts "You are the player1 with color #{input}"
    color = input.to_sym == :blue ? :red : :blue
    @player2 = HumanPlayer.new(color, @display)
    puts "And player2's color is #{color.to_s}"
    puts "start with player1, #{input},:"
    @curr_player = @player1
    @display.render
  end

  def play
    loop do
      puts "It's #{@curr_player.color}'s turn"
      pos = @curr_player.make_move
      start_pos, end_pos = pos
      begin
        @board.move_piece(start_pos, end_pos)
      rescue => exception
        "Select a valid position"
      end 
      
      # system("clear")
      @display.render
      
      swap_turn!
    end
    
  end

  def swap_turn!
    @curr_player = @curr_player == @player1 ? @player2 : @player1
  end
end

g = Game.new