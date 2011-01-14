$: << "."
require 'bowling_scorer'

describe "#score" do
  let(:bowling) { BowlingScorer.new }
  context "with no throws" do
    let(:throws) { [] }
    it "returns zero" do
      bowling.score(throws).should == 0
    end
  end
  context "with one throw" do
    let(:throws) { [9] }
    it "returns the throw" do
      bowling.score(throws).should == 9
    end
  end
end
