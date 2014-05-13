require "spec_helper"

describe GistsController do
  describe "routing" do

    it "routes to #index" do
      get("/gists").should route_to("gists#index")
    end

    it "routes to #new" do
      get("/gists/new").should route_to("gists#new")
    end

    it "routes to #show" do
      get("/gists/1").should route_to("gists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/gists/1/edit").should route_to("gists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/gists").should route_to("gists#create")
    end

    it "routes to #update" do
      put("/gists/1").should route_to("gists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/gists/1").should route_to("gists#destroy", :id => "1")
    end

  end
end
