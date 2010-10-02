def test_total_cost
  order = Order.create(
    :items => [Item.create(:cost => 10)])
  assert_equal 10, order.total_cost
end

def test_total_cost
  order = Order.create(
    :items => [Item.create(:cost => 10)])
  assert_equal 10, order.total_cost
end

def test_total_cost
  order = Order.new(
    :items => [Item.new(:cost => 10)])
  assert_equal 10, order.total_cost
end

def test_order_fails_with_bad_supplier
  order = Order.new(:supplier => :bad)
  assert ! order.save
end

def test_order_fails_with_bad_supplier
  order = Order.new(:supplier => :bad)
  assert ! order.valid?
end

def test_order_fails_with_bad_supplier
  order = Order.new(:supplier => :bad)
  assert ! order.valid?
end

def test_order_fails_with_bad_supplier
  order = Order.new(:supplier => :bad)

  assert ! order.valid?
  assert model.errors.on(:supplier)
  assert_match(/(invalid|bad).*supplier/i,
    model.errors.on(field).to_s,
end
