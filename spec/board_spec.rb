require "./lib/board.rb"
require "./lib/column.rb"

describe Board do
  describe "#player_input" do
    
    before do
      $stdin = StringIO.new("1")
    end

    it "gets input from terminal" do
      player_1 = double("player1")
      expect(subject.player_input(player_1)).to eq(1)
    end
  end

  describe "#mark_board" do

    context "valid selection is entered" do  
      it "updates board with player selection" do
        subject.mark_board(1, "R")
        expect(subject.columns[0]).to be_a(Node) 
      end
    end
  end

  context "valid input" do
    describe "#valid_input?" do
      it "returns true" do
        expect(subject.valid_input?(1))
      end
    end
  end

  context "input invalid" do
    describe "#valid_input?" do
      it "returns false" do
        !expect(subject.valid_input?(10))
      end 
    end
  end

end