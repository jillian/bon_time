require 'spec_helper'

describe "events/new" do
  before(:each) do
    assign(:event, stub_model(Event,
      :address => "MyString",
      :city => "MyString",
      :zipcode => "MyString",
      :latitude => 1.5,
      :longitude => 1.5,
      :user => nil
    ).as_new_record)
  end

  it "renders new event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", events_path, "post" do
      assert_select "input#event_address[name=?]", "event[address]"
      assert_select "input#event_city[name=?]", "event[city]"
      assert_select "input#event_zipcode[name=?]", "event[zipcode]"
      assert_select "input#event_latitude[name=?]", "event[latitude]"
      assert_select "input#event_longitude[name=?]", "event[longitude]"
      assert_select "input#event_user[name=?]", "event[user]"
    end
  end
end
