require_relative 'card'
class Deck
  RANKS = ['A', '2', '3', '4', '5', '6', '7',
    '8', '9', '10', 'J', 'Q', 'K']
  SUITS = ['diamonds', 'clubs', 'hearts', 'spades']

  attr_reader :cards_deck
  def initialize
    @cards_deck = generate_cards
  end


  private 
  def generate_cards
    cards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        cards << Card.new(rank, suit)
      end
    end
    cards
  end


end