require 'spec_helper'

describe "events/index" do
  before(:each) do
    assign(:events, [
      stub_model(Event,
        :address => "Address",
        :city => "City",
        :zipcode => "Zipcode",
        :latitude => 1.5,
        :longitude => 1.5,
        :user => nil
      ),
      stub_model(Event,
        :address => "Address",
        :city => "City",
        :zipcode => "Zipcode",
        :latitude => 1.5,
        :longitude => 1.5,
        :user => nil
      )
    ])
  end

  it "renders a list of events" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Zipcode".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
