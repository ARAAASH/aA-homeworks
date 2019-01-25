require "tdd"
require "rspec"

describe "#my_uniq" do
  subject(:array) {[1,2,1,3,3]}
  it "test if it returns empty for empty arrays" do
    expect(my_uniq([])).to be_empty
  end

  it "test for any duplicates in the output" do
    expect(my_uniq(array)).to eq([1,2,3])
  end
end

describe "#two_sum" do
  subject(:array) { [-1, 0, 2, -2, 1] }

  it "finds all pairs of positions where the elements at those positions sum to zero." do
    expect(two_sum(array)).to eq([[0, 4], [2, 3]])
  end

  it "always outputs 2-d array" do 
    expect(two_sum(array)[0]).not_to eq(nil) 
  end

  it "generates empty array for empty input"
end