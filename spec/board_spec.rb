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
    context "there is a consecutive row win condition" do
      it "returns true" do
        subject.nodes = {[1, 1]=>"[W]", [1, 2]=>"[W]", [1, 3]=>"[W]", [1, 4]=>"[W]",[1, 5]=>"[ ]", [1, 6]=>"[ ]", [1, 7]=>"[ ]"}
        expect(subject.win_row?([1,1], "W", 0, 1)).to be(true)
    end
  end

    context "there is a broken up row win condition" do
      it "returns true" do
        subject.nodes = {[1, 1]=>"[W]", [1, 2]=>"[B]", [1, 3]=>"[W]", [1, 4]=>"[W]",[1, 5]=>"[W]", [1, 6]=>"[W]", [1, 7]=>"[ ]"}
        expect(subject.win_row?([1,1], "W", 0, 1)).to be(true)
    end
  end

    context "there is no row win condition" do  
      it "returns false" do
        subject.nodes = {[1, 1]=>"[]", [1, 2]=>"[W]", [1, 3]=>"[W]", [1, 4]=>"[W]",[1, 5]=>"[ ]", [1, 6]=>"[ ]", [1, 7]=>"[ ]"}
        expect(subject.win_row?([1,1],"W", 0, 1)).to be(false)
      end
    end
    context "there is a consecutive column win condition" do
      it "returns true" do
        subject.nodes = {[1, 1]=>"[W]", [2, 1]=>"[W]", [3, 1]=>"[W]", [4, 1]=>"[W]",[5, 1]=>"[ ]", [6, 1]=>"[ ]", [7, 1]=>"[ ]"}
        expect(subject.win_row?([1,1], "W", 1, 0)).to be(true)
    end
  end

    context "there is a broken up column win condition" do
      it "returns true" do
        subject.nodes = {[1, 1]=>"[W]", [2, 1]=>"[B]", [3, 1]=>"[W]", [4, 1]=>"[W]",[5, 1]=>"[W]", [6, 1]=>"[W]", [7, 1]=>"[ ]"}
        expect(subject.win_row?([1,1], "W", 1, 0)).to be(true)
    end
  end

    context "there is no column win condition" do  
      it "returns false" do
        subject.nodes = {[1, 1]=>"[]", [2, 1]=>"[W]", [3, 1]=>"[W]", [4, 1]=>"[W]",[5, 1]=>"[ ]", [6, 1]=>"[ ]", [7, 1]=>"[ ]"}
        expect(subject.win_row?([1,1], "W", 1, 0)).to be(false)
      end
    end
  end
    describe "win_diagonal_left?" do
    
      context "there is a consecutive left diagonal win condition" do
        it "returns true" do
          subject.nodes = {[1, 1]=>"[W]", [2, 2]=>"[W]", [3, 3]=>"[W]", [4, 4]=>"[W]",[5, 5]=>"[ ]", [6, 6]=>"[ ]"}
          expect(subject.win_row?([1,1], "W", 1, 1)).to be(true)
      end
    end

      context "there is a broken up left diagonal win condition" do
        it "returns true" do
          subject.nodes = {[1, 1]=>"[W]", [2, 2]=>"[B]", [3, 3]=>"[W]", [4, 4]=>"[W]",[5, 5]=>"[W]", [6, 6]=>"[W]"}
          expect(subject.win_row?([1,1], "W", 1, 1)).to be(true)
      end
    end

      context "there is no left diagonal win condition" do  
        it "returns false" do
          subject.nodes = {[1, 1]=>"[]", [2, 2]=>"[W]", [3, 3]=>"[W]", [4, 4]=>"[W]",[5, 5]=>"[ ]", [6, 6]=>"[ ]"}
          expect(subject.win_row?([1,1], "W", 1, 1)).to be(false)
        end
      end
    

      context "current is nil" do  
        it "returns false" do
          subject.nodes = {[1, 1]=>"[]", [2, 2]=>"[W]", [3, 3]=>"[W]", [4, 4]=>"[W]",[5, 5]=>"[ ]", [6, 6]=>"[ ]"}
          expect(subject.win_row?(nil, "W", 1, 1)).to be(false)
        end
      end

      context "there is a consecutive right diagonal win condition" do
        it "returns true" do
          subject.nodes = {[1, 7]=>"[W]", [2, 6]=>"[W]", [3, 5]=>"[W]", [4, 4]=>"[W]",[5, 3]=>"[ ]", [6, 2]=>"[ ]"}
          expect(subject.win_row?([1,7], "W", 1, -1)).to be(true)
      end
    end

      context "there is a broken up right diagonal win condition" do
        it "returns true" do
          subject.nodes = {[1, 7]=>"[W]", [2, 6]=>"[B]", [3, 5]=>"[W]", [4, 4]=>"[W]",[5, 3]=>"[W]", [6, 2]=>"[W]"}
          expect(subject.win_row?([1,7], "W", 1, -1)).to be(true)
      end
    end

      context "there is no right diagonal win condition" do  
        it "returns false" do
          subject.nodes = {[1, 7]=>"[]", [2, 6]=>"[W]", [3, 5]=>"[W]", [4, 4]=>"[W]",[5, 3]=>"[ ]", [6, 2]=>"[ ]"}
          expect(subject.win_row?([1,7], "W", 1, -1)).to be(false)
        end
      end

      context "current is nil" do  
        it "returns false" do
          subject.nodes = {[1, 7]=>"[]", [2, 6]=>"[W]", [3, 5]=>"[W]", [4, 4]=>"[W]",[5, 3]=>"[ ]", [6, 2]=>"[ ]"}
          expect(subject.win_row?(nil, "W", 1, -1)).to be(false)
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