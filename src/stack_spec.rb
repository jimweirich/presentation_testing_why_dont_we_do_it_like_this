class Stack
  def push(item)
  end
  def pop
  end
  def empty?
    true
  end
  def size
    1
  end
end

describe Stack do
  def a_stack_with_one_item
    s = Stack.new
    s.push(:one)
    s
  end

  context "stack with one item" do
    subject { a_stack_with_one_item }
    context "when poped" do
      before { subject.pop }
      it { should be_empty }
    end
  end
end
