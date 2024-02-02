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

  describe "#mark_board" do
    
    context "mark board with B" do
      it "changes node value to marker" do
      
      end
    end
  

    context "mark board with W" do
      it "changes node value to marker" do
      
      end
    end
  end

  describe "#win_row?" do
    context "there is a consecutive win condition" do
      it "returns true" do
        subject.nodes = {[1, 1]=>"[W]", [1, 2]=>"[W]", [1, 3]=>"[W]", [1, 4]=>"[W]",[1, 5]=>"[ ]", [1, 6]=>"[ ]", [1, 7]=>"[ ]"}
        expect(subject.win_row?(1,"W")).to be(true)
    end
  end

    context "there is a broken up win condition" do
      it "returns true" do
        subject.nodes = {[1, 1]=>"[W]", [1, 2]=>"[B]", [1, 3]=>"[W]", [1, 4]=>"[W]",[1, 5]=>"[W]", [1, 6]=>"[W]", [1, 7]=>"[ ]"}
        expect(subject.win_row?(1,"W")).to be(true)
    end
  end

    context "there is no win condition" do  
      it "returns false" do
        subject.nodes = {[1, 1]=>"[]", [1, 2]=>"[W]", [1, 3]=>"[W]", [1, 4]=>"[W]",[1, 5]=>"[ ]", [1, 6]=>"[ ]", [1, 7]=>"[ ]"}
        expect(subject.win_row?(1,"W")).to be(false)
      end
    end
  end

  describe "#scan_diag_left" do

    context "if the input node exists in a diagonal" do
      it "returns the first node in the diagonal"
    end

    context "if the input node does not exist in a diagonal" do
      it "returns nil"
    end
  end




end