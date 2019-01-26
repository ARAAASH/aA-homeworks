require "hand"

describe Hand do 
  let(:card1) { double('card1', :rank => 'A') }
  let(:card2) { double('card2', :rank => 'A') }
  subject(:hand) { Hand.new([card1, card2]) }
  describe '#initialize' do 
    
    it 'takes an an array of cards' do
      expect(hand.cards).to eq([card1, card2])
    end
  end
  
  describe "#num_of_a_kind" do 
  let(:card1) { double('card1', :rank => 'A') }
  let(:card2) { double('card2', :rank => 'A') }
  let(:card3) { double('card3', :rank => '5') }
  let(:card4) { double('card4', :rank => 'A') }
  subject(:hand) { Hand.new([card1, card2, card3, card4]) }
    it "counts number of a cards in a same rank" do
      expect(hand.num_of_a_kind).to eq(3)
    end

  end
end
