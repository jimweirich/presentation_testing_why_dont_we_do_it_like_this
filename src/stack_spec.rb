class Stack
  def push(item)
  end
  def pop
  end
  def empty?
    true
  end
end

describe Stack do
  def a_stack_with_one_item
    s = Stack.new
    s.push(:one)
    s
  end

  context "stack with one item" do
    let(:stack) { a_stack_with_one_item }
    context "when poped" do
      before { stack.pop }
      it { should be_empty }
    end
  end
end
