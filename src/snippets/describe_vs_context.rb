it "clears the name field" do
  @item.clear_name
  assert_equal "", @item.name
end

it "clears the address field" do
  @item.clear_address
  assert_equal "", @item.address
end

# --------------------------------------------------------------------

describe Item do
  describe "#clear_name" do
    it "clears the name field" do
      ...
    end
  end
  describe "#clear_address" do
    it "clears the address field" do
      ...
    end
  end
end

# --------------------------------------------------------------------

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

# --------------------------------------------------------------------

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
