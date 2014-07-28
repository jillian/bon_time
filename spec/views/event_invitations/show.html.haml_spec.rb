require 'spec_helper'

describe "event_invitations/show" do
  before(:each) do
    @event_invitation = assign(:event_invitation, stub_model(EventInvitation,
      :user => nil,
      :event => nil,
      :accepted => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/false/)
  end
end
