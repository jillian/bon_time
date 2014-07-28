require "spec_helper"

describe EventInvitationsController do
  describe "routing" do

    it "routes to #index" do
      get("/event_invitations").should route_to("event_invitations#index")
    end

    it "routes to #new" do
      get("/event_invitations/new").should route_to("event_invitations#new")
    end

    it "routes to #show" do
      get("/event_invitations/1").should route_to("event_invitations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/event_invitations/1/edit").should route_to("event_invitations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/event_invitations").should route_to("event_invitations#create")
    end

    it "routes to #update" do
      put("/event_invitations/1").should route_to("event_invitations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/event_invitations/1").should route_to("event_invitations#destroy", :id => "1")
    end

  end
end
