require 'spec_helper'

describe "events/show" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :address => "Address",
      :city => "City",
      :zipcode => "Zipcode",
      :latitude => 1.5,
      :longitude => 1.5,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address/)
    rendered.should match(/City/)
    rendered.should match(/Zipcode/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(//)
  end
end
