require_relative "deck"
require_relative "card"

class Hand
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def num_of_a_kind
    kinds = []
    cards.each { |card| kinds << card.rank }
    kinds.length - kinds.uniq.length + 1
  end

  def flush
    suits = []
    cards.each { |card| suits << card.suit }
    if cards.uniq.length == 1
      return true
    else
      return false
    end
  end

end