require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe FriendshipsController do

  # This should return the minimal set of attributes required to create a valid
  # Friendship. As you add validations to Friendship, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "user" => "" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FriendshipsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all friendships as @friendships" do
      friendship = Friendship.create! valid_attributes
      get :index, {}, valid_session
      assigns(:friendships).should eq([friendship])
    end
  end

  describe "GET show" do
    it "assigns the requested friendship as @friendship" do
      friendship = Friendship.create! valid_attributes
      get :show, {:id => friendship.to_param}, valid_session
      assigns(:friendship).should eq(friendship)
    end
  end

  describe "GET new" do
    it "assigns a new friendship as @friendship" do
      get :new, {}, valid_session
      assigns(:friendship).should be_a_new(Friendship)
    end
  end

  describe "GET edit" do
    it "assigns the requested friendship as @friendship" do
      friendship = Friendship.create! valid_attributes
      get :edit, {:id => friendship.to_param}, valid_session
      assigns(:friendship).should eq(friendship)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Friendship" do
        expect {
          post :create, {:friendship => valid_attributes}, valid_session
        }.to change(Friendship, :count).by(1)
      end

      it "assigns a newly created friendship as @friendship" do
        post :create, {:friendship => valid_attributes}, valid_session
        assigns(:friendship).should be_a(Friendship)
        assigns(:friendship).should be_persisted
      end

      it "redirects to the created friendship" do
        post :create, {:friendship => valid_attributes}, valid_session
        response.should redirect_to(Friendship.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved friendship as @friendship" do
        # Trigger the behavior that occurs when invalid params are submitted
        Friendship.any_instance.stub(:save).and_return(false)
        post :create, {:friendship => { "user" => "invalid value" }}, valid_session
        assigns(:friendship).should be_a_new(Friendship)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Friendship.any_instance.stub(:save).and_return(false)
        post :create, {:friendship => { "user" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested friendship" do
        friendship = Friendship.create! valid_attributes
        # Assuming there are no other friendships in the database, this
        # specifies that the Friendship created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Friendship.any_instance.should_receive(:update).with({ "user" => "" })
        put :update, {:id => friendship.to_param, :friendship => { "user" => "" }}, valid_session
      end

      it "assigns the requested friendship as @friendship" do
        friendship = Friendship.create! valid_attributes
        put :update, {:id => friendship.to_param, :friendship => valid_attributes}, valid_session
        assigns(:friendship).should eq(friendship)
      end

      it "redirects to the friendship" do
        friendship = Friendship.create! valid_attributes
        put :update, {:id => friendship.to_param, :friendship => valid_attributes}, valid_session
        response.should redirect_to(friendship)
      end
    end

    describe "with invalid params" do
      it "assigns the friendship as @friendship" do
        friendship = Friendship.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Friendship.any_instance.stub(:save).and_return(false)
        put :update, {:id => friendship.to_param, :friendship => { "user" => "invalid value" }}, valid_session
        assigns(:friendship).should eq(friendship)
      end

      it "re-renders the 'edit' template" do
        friendship = Friendship.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Friendship.any_instance.stub(:save).and_return(false)
        put :update, {:id => friendship.to_param, :friendship => { "user" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested friendship" do
      friendship = Friendship.create! valid_attributes
      expect {
        delete :destroy, {:id => friendship.to_param}, valid_session
      }.to change(Friendship, :count).by(-1)
    end

    it "redirects to the friendships list" do
      friendship = Friendship.create! valid_attributes
      delete :destroy, {:id => friendship.to_param}, valid_session
      response.should redirect_to(friendships_url)
    end
  end

end
