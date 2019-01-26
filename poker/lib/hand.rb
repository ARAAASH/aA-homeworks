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
    num_of_a_kind == 2 && !flush? && !full_house?
  end

  def four_of_a_kind?
    num_of_a_kind == 4 
  end

  def three_of_a_kind?
    num_of_a_kind == 3 && !flush? && !full_house?
  end

  def straight?
    sequence? && !flush? 
  end

  def flush?
    suits = []
    cards.each { |card| suits << card.suit }
    if suits.uniq.length == 1
      return true
    else
      return false
    end
  end

  def full_house?
    card_values = []
    cards.each { |card| card_values << card.get_value }
    uniq_cards = card_values.sort.uniq
    if uniq_cards.length == 2
      count_cards1 = card_values.count(uniq_cards[0])
      count_cards2 = card_values.count(uniq_cards[1])
      if (count_cards1 == 2 && count_cards2 == 3) || (count_cards1 == 3 && count_cards2 == 2)
        return true
      else
        return false
      end  
    else
      return false
    end

  end

  def two_pairs?
    card_values = []
    cards.each { |card| card_values << card.get_value }
    uniq_cards = card_values.sort.uniq
   
    if uniq_cards.length == 3

      count_cards1 = card_values.count(uniq_cards[0])
   
      count_cards2 = card_values.count(uniq_cards[1])
   
      count_cards3 = card_values.count(uniq_cards[2])
    
      if (count_cards1 == 2 && count_cards2 == 2) || (count_cards1 == 2 && count_cards3 == 2) || (count_cards2 == 2 && count_cards3 == 2)
        return true
      else
        return false
      end
    else
      return false
    end

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

end