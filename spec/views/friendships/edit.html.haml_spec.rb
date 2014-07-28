require 'spec_helper'

describe "friendships/edit" do
  before(:each) do
    @friendship = assign(:friendship, stub_model(Friendship,
      :user => "",
      :friend => ""
    ))
  end

  it "renders the edit friendship form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", friendship_path(@friendship), "post" do
      assert_select "input#friendship_user[name=?]", "friendship[user]"
      assert_select "input#friendship_friend[name=?]", "friendship[friend]"
    end
  end
end
