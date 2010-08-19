class BowlingScorer
  def score(throws)
    throws.inject(0) { |s, item| s + item }
  end
end

describe BowlingScorer do
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

  context "with two throw" do
    let(:throws) { [3,6] }
    it "returns the sum of the throws" do
      bowling.score(throws).should == 9
    end
  end

  context "with a perfect game" do
    let(:throws) { [10] * 12 }
    it "returns 300" do
      bowling.score(throws).should == 9
    end
  end
end
