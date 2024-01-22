require "./lib/column.rb"

describe Column do
  
  context "column has one node" do
    describe "#size" do
    it "returns number of nodes in column" do
      subject.add_marker("R")
        expect(subject.size).to eq(1)
      end
    end
  end

  context "column has two nodes" do
    describe "#size" do
    it "returns number of nodes in column" do
      subject.add_marker("R")
      subject.add_marker("B")
        expect(subject.size).to eq(2)
      end
    end
  end





end
