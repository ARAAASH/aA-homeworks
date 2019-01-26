require "hand"

describe Hand do 
  let(:card1) { double('card1', :rank => '2', :get_value => 2, :suit => 'spades') }
    let(:card2) { double('card2', :rank => 'A', :get_value => 1, :suit => 'spades') }
    let(:card3) { double('card3', :rank => '5', :get_value => 5, :suit => 'spades') }
    let(:card4) { double('card4', :rank => '3', :get_value => 3, :suit => 'spades') }
    let(:card5) { double('card5', :rank => '4', :get_value => 4, :suit => 'spades') }
    subject(:hand) { Hand.new([card1,card2,card3,card4,card5]) }
  describe '#initialize' do 
    
    it 'takes an an array of cards' do
      expect(hand.cards).not_to eq([card1, card2])
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

  describe "#flush?" do 
    let(:card1) { double('card1', :suit => 'spades') }
    let(:card2) { double('card2', :suit => 'spades') }
    let(:card3) { double('card3', :suit => 'hearts') }
    let(:card4) { double('card4', :suit => 'spades') }
    let(:card5) { double('card5', :suit => 'spades') }
    subject(:hand) { Hand.new([card1,card2,card3,card4,card5]) }
    it "true if all the cards are in same suit" do 
      expect(hand.flush?).to be false  
    end
  end

  describe "#sequence?" do 
    it "returns true if all the cards are in sequence" do

      expect(hand.sequence?).to be true
    end
  end

  describe "#straight_flush?" do 
    it "returns true if hand is straight flush" do 
      expect(hand.straight_flush?).to be false
    end
  end

end
