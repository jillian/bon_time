require 'spec_helper'

describe "event_invitations/edit" do
  before(:each) do
    @event_invitation = assign(:event_invitation, stub_model(EventInvitation,
      :user => nil,
      :event => nil,
      :accepted => false
    ))
  end

  it "renders the edit event_invitation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", event_invitation_path(@event_invitation), "post" do
      assert_select "input#event_invitation_user[name=?]", "event_invitation[user]"
      assert_select "input#event_invitation_event[name=?]", "event_invitation[event]"
      assert_select "input#event_invitation_accepted[name=?]", "event_invitation[accepted]"
    end
  end
end
