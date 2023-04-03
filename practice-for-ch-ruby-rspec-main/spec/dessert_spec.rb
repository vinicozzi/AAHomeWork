require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe "#initialize" do
  it "sets a type" do
    dessert = Dessert.new("cake", 300, "kyle")
    expect(dessert.type).to eq("cake")
  end

  it "sets a quantity" do
    dessert = Dessert.new("cake", 300, "kyle")
    expect(dessert.quantity).to eq(300)
  end

  it "starts ingredients as an empty array" do 
    dessert = Dessert.new("cake", 300, "kyle")
    expect(dessert.ingredients).to eq([])
  end

  it "raises an argument error when given a non-integer quantity" do
    expect { Dessert.new("cake", "three hundred", "kyle") }.to raise_error(ArgumentError)
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do 
      dessert = Dessert.new("cake", 300, "kyle")
      dessert.add_ingredient("flour")
      expect(dessert.ingredients).to include("flour")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do 
      dessert = Dessert.new("cake", 300, "kyle")
      dessert.mix!
      expect(dessert.ingredients).to eq(dessert.ingredients.shuffle!)
    end 
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do 
      dessert = Dessert.new("cake", 300, "kyle")
      dessert.eat(200) 
      expect(dessert.quantity).to eq(300-200)
    end 
    it "raises an error if the amount is greater than the quantity" do 
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do 
      dessert = Dessert.new("cake", 300, "kyle")
      expect(dessert.serve).to eq("Kyle has made 300 cakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do 
      dessert = Dessert.new("cake", 300, "kyle")
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end 
end 