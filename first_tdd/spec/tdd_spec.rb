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
  let (:ar) { [] }
  let (:arr1) { [-4, 5, 4, 3, -4] }
  let (:arr2) { [7, -7, -7, 4, 3, -4] }

  it "finds all pairs of positions where the elements at those positions sum to zero." do
    expect(two_sum(array)).to eq([[0, 4], [2, 3]])
  end

  it "generates empty array for empty input" do
    expect(two_sum(ar)).to eq([])
  end

  it "smaller first element, in the output, comes first" do
    expect(two_sum(arr1)).to eq([[0,2], [2,4]])
  end

  it "outputs is sorted dictionary-wise" do
    expect(two_sum(arr2)).to eq([[0,1], [0,2], [3,5]])
  end

end