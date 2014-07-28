require 'spec_helper'

describe "friendships/new" do
  before(:each) do
    assign(:friendship, stub_model(Friendship,
      :user => "",
      :friend => ""
    ).as_new_record)
  end

  it "renders new friendship form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", friendships_path, "post" do
      assert_select "input#friendship_user[name=?]", "friendship[user]"
      assert_select "input#friendship_friend[name=?]", "friendship[friend]"
    end
  end
end
