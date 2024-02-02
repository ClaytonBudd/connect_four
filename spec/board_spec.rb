require "./lib/board.rb"

describe Board do

  describe "#valid_input?" do
    
    context "valid input" do
      it "returns true" do
        expect(subject.valid_input?(1))
      end
    end
  

    context "input invalid" do
      it "returns false" do
        !expect(subject.valid_input?(10))
      end 
    end
  end

  describe "#add_node" do
    it "takes a node and finds all connections to itself" do
      expect(subject.add_node([3,3])).to eq([[2,3],[2,4],[3,4],[4,4],[4,3],[4,2],[3,2],[2,2]])
    end
  end

  # describe "#unmark_board" do
  #   it "replaces node edges with '[ ]' " do
  #     @nodes = double({[1,1]=>[[1,2],[2,2],[2,1]]})
  #     subject.unmark_board
  #     expect(@nodes).to eq({[1,1] => "[ ]"})
  #   end
  # end

  context "mark board with B" do
    describe "#mark_board" do
      it "changes node value to marker" do
      
      end
    end
  end

  context "mark board with W" do
    describe "#mark_board" do
      it "changes node value to marker" do
      
      end
    end
  end

  context ""

end