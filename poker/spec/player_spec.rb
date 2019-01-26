require "player"

describe Player do 
  let(:hand) { double('hand') }
  subject(:player) { Player.new(hand) }
  
  describe '#initialize' do
    it "has a hand" do 
      expect(player.hand).to eq(hand)
    end

    it "initialize with an empty pot" do 
      expect(player.pot).to be_empty 
    end
  end
  
end