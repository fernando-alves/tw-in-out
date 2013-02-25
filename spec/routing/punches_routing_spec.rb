require "spec_helper"

describe PunchesController do
  describe "routing" do
    it "routes to #index" do
      get("/punches").should route_to("punches#index")
    end

    it "routes to #new" do
      get("/punches/new").should route_to("punches#new")
    end

    it "routes to #show" do
      get("/punches/1").should route_to("punches#show", :id => "1")
    end

    it "routes to #edit" do
      get("/punches/1/edit").should route_to("punches#edit", :id => "1")
    end

    it "routes to #create" do
      post("/punches").should route_to("punches#create")
    end

    it "routes to #update" do
      put("/punches/1").should route_to("punches#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/punches/1").should route_to("punches#destroy", :id => "1")
    end

  end
end
