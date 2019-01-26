require_relative "deck"
require_relative "card"

class Hand
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def straight_flush?
    sequence? && flush?
  end

  def pair?
      if num_of_a_kind == 2
  end
  

  def sequence?
    card_values = []
    cards.each { |card| card_values << card.get_value }
    new_card_values = []
    sort_values = card_values.sort
    card_values.length.times { |i| new_card_values << sort_values[0]+i }
    if sort_values == new_card_values
      return true
    else
      return false
    end
  end

  def num_of_a_kind
    kinds = []
    cards.each { |card| kinds << card.rank }
    kinds.length - kinds.uniq.length + 1
  end

  def flush?
    suits = []
    cards.each { |card| suits << card.suit }
    if cards.uniq.length == 1
      return true
    else
      return false
    end
  end

end