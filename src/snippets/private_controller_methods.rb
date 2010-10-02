describe :load_personal_data do
  before do
    @entry = stubbed_entry
    @entry.stub!(:owner).and_return(:owner_id)
    controller.instance_variable_set('@entry', @entry)
  end

  it "loads the personal data from from the" do
    controller.stub!(:params).
      and_return(:person => 'John Doe')
    PersonalDataService.
      should_receive(:get_personal_data).
      with(:owner_id)

    controller.send(:load_personal_data)
  end
end
