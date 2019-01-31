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

describe "#my_transpose" do
  subject(:array) { [[0,1,2],[3,4,5],[6,7,8]] }
  let(:emp) {[]}

  it "no changes in the first and last element" do
    expect(my_transpose(array)[0][0]).to eq(array[0][0])
    expect(my_transpose(array)[-1][-1]).to eq(array[-1][-1])
  end

  it "output has the same size" do
    expect(my_transpose(array).length).to eq(array.length)
    expect(my_transpose(array)[0].length).to eq(array[0].length)
  end

  it "exchanges the elemets between rows and columns" do
    expect(my_transpose(array)[1][2]).to eq(array[2][1])
  end

  it "doesn't do anything to an empty array" do
    expect(my_transpose(emp)).to eq([])
  end

end

describe "#stock_picker" do
  subject(:stocks) { [90, 87, 86, 90, 91, 92, 85] }

  it "second element is higher than the first element" do
    expect(stock_picker(stocks)[0]).to be < stock_picker(stocks)[1]
  end

  it "doesn't sell stock before buy it" do
    expect(stock_picker(stocks)).to eq([2,5])
    expect(stock_picker(stocks)).not_to eq([6,5])
  end
end