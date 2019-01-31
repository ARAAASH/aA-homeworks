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

  describe '#move' do 

    it 'subtract the disk from the rod' do 
      towers_hanoi.move(1,2)
      expect(towers_hanoi.rod1).not_to include(1) 
    end

    it 'adds the disk to the selected rod' do 
      towers_hanoi.move(1,2)
      expect(towers_hanoi.rod2).to include(1)
    end

    it 'always pop the element from the top of the rod' do
      towers_hanoi.move(1,2)
      expect(towers_hanoi.rod3).not_to include(2)
      expect(towers_hanoi.rod3).not_to include(3)
      expect(towers_hanoi.rod3).not_to include(4)
    end
  end

  describe '#won?' do 
    it 'check if the destintion pile is full' do
      expect(towers_hanoi.won?(2)).to be false
      towers_hanoi.move(1,2)
      towers_hanoi.move(1,2)
      towers_hanoi.move(1,2)
      towers_hanoi.move(1,2)
      expect(towers_hanoi.won?(2)).to be true
    end

    it 'all the disks must be in correct order' do

      towers_hanoi.rod1.sort.reverse
      expect(towers_hanoi.won?(1)).to be true
    end
  end
end
