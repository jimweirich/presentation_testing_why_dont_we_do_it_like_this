$: << "."
require 'bowling_scorer'

describe "#score" do
  before { @bowling = BowlingScorer.new }
  context "with no throws" do
    before { @throws = [] }
    it "returns zero" do
      @bowling.score(@throws).should == 0
    end
  end
  context "with one throw" do
    before { @throws = [9] }
    it "returns the throw" do
      @bowling.score(@throws).should == 9
    end
  end
end
