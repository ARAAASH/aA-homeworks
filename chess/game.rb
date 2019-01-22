require_relative "board"
require_relative "display"
require_relative "player"

class Game
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @player1 
    @player2
    @curr_player
    set_players
  end

  def set_players
    puts "Pick a color: red or blue?"
    input = gets.chomp 
    @player1 = Player.new(input.to_sym, @display)
    puts "You are the player1 with color #{input}"
    color = input.to_sym == :blue ? :red : :blue
    @player2 = Player.new(color, @display)
    puts "And player2's color is #{color.to_s}"
    puts "start with player1, #{input},:"
    @curr_player = @player1
    @display.render
  end

end

g = Game.new