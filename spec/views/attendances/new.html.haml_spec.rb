require 'spec_helper'

describe "attendances/new" do
  before(:each) do
    assign(:attendance, stub_model(Attendance,
      :user => nil,
      :event => nil,
      :location => nil
    ).as_new_record)
  end

  it "renders new attendance form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", attendances_path, "post" do
      assert_select "input#attendance_user[name=?]", "attendance[user]"
      assert_select "input#attendance_event[name=?]", "attendance[event]"
      assert_select "input#attendance_location[name=?]", "attendance[location]"
    end
  end
end
