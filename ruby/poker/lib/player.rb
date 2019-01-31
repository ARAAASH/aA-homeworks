
class Player
  attr_reader :hand, :bankroll, :current_bet
  def initialize(bankroll)
    @bankroll = bankroll
    @current_bet = 0
  end

  def deal_in(hand)
    @hand = hand
  end

  
  
end