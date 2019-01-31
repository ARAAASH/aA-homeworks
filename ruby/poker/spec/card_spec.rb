require 'card'

describe Card do 
  subject(:card) { Card.new('2', 'clubs') }
  describe '#initialize' do 

    it 'assign rank and suit to the card' do 
      expect(card.rank).to eq('2')
      expect(card.suit).to eq('clubs')
    end

    it "raise error if suit is invalid" do 
      expect{ Card.new('A', 'spad') }.to raise_error("not a valid suit!")
    end

    it "raise error if rank is invalid" do 
      expect{ Card.new('13', 'clubs') }.to raise_error("not a valid rank!")
    end
  end

  describe '#get_value' do 
    it 'return the value of the cards rank' do 
      expect(card.get_value).to eq(2)
    end
  end

end
