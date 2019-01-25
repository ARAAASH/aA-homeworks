require "towers_hanoi"

describe TowersHanoi do
  subject(:towers_hanoi) { TowersHanoi.new([4,3,2,1]) }
  
  describe "#initialize" do 
    it 'fill rod1 with numbers' do 
      expect(towers_hanoi.rod1).to eq([4,3,2,1])
    end

    it 'keeps the other rods empty' do
      expect(towers_hanoi.rod2).to be_empty 
      expect(towers_hanoi.rod3).to be_empty 
      expect(towers_hanoi.rod4).to be_empty 
    end
  end

  
end
