describe Stack do
  context "stack with one item" do
    let(:stack) { a_stack_with_one_item }
    context "when popped" do
      before { stack.pop }
      it "should be empty" do
        stack.should be_empty
      end
    end
  end
end

# --------------------------------------------------------------------

describe Stack do
  context "stack with one item" do
    let(:stack) { a_stack_with_one_item }
    context "when popped" do
      before { stack.pop }
      it { should be_empty }
    end
  end
end

# --------------------------------------------------------------------

Given(:stack) { a_stack_with_one_item }
When { stack.pop }
Then { stack.empty? }
