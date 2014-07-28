require 'spec_helper'

describe "event_invitations/new" do
  before(:each) do
    assign(:event_invitation, stub_model(EventInvitation,
      :user => nil,
      :event => nil,
      :accepted => false
    ).as_new_record)
  end

  it "renders new event_invitation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", event_invitations_path, "post" do
      assert_select "input#event_invitation_user[name=?]", "event_invitation[user]"
      assert_select "input#event_invitation_event[name=?]", "event_invitation[event]"
      assert_select "input#event_invitation_accepted[name=?]", "event_invitation[accepted]"
    end
  end
end
