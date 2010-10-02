# BEFORE

%w(name address).each do |feature|
  it "clears the #{feature} field" do
    @item.send("clear_#{feature}")
    assert_equal "", @item.name
  end
end


# AFTER

it "clears the name field" do
  @item.clear_name
  assert_equal "", @item.name
end

it "clears the address field" do
  @item.clear_address
  assert_equal "", @item.address
end
