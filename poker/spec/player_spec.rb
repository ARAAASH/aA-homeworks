require "player"

describe Player do 
  let(:hand) { double("hand") }
  subject(:player) { Player.new(100) }
  
  describe '#initialize' do
    it "has banckroll" do 
      expect(player.bankroll).to eq(100)  
    end

    it "start with current bet of zero" do 
      expect(player.current_bet).to eq(0)
    end
  end

  describe "#deal_in" do 
    it "gives player a hand" do 
      player.deal_in(hand)
      expect(player.hand).to eq(hand)
    end
  end
  
end