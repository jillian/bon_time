require 'spec_helper'

describe "event_invitations/index" do
  before(:each) do
    assign(:event_invitations, [
      stub_model(EventInvitation,
        :user => nil,
        :event => nil,
        :accepted => false
      ),
      stub_model(EventInvitation,
        :user => nil,
        :event => nil,
        :accepted => false
      )
    ])
  end

  it "renders a list of event_invitations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
