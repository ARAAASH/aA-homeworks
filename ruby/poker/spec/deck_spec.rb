require "deck"

describe Deck do
  subject(:deck) { Deck.new }

  describe '#initialize' do 

    it "generates a deck of 52 cards" do 
      expect(deck.cards.count).to eq(52)
    end

    it "has all four suits and ranks in it" do 
      expect(deck.cards[50].suit).to include('spades')
     
    end

  end
end