require "spec_helper"

describe TimeChunksController do
  describe "routing" do

    it "routes to #index" do
      get("/time_chunks").should route_to("time_chunks#index")
    end

    it "routes to #new" do
      get("/time_chunks/new").should route_to("time_chunks#new")
    end

    it "routes to #show" do
      get("/time_chunks/1").should route_to("time_chunks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/time_chunks/1/edit").should route_to("time_chunks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/time_chunks").should route_to("time_chunks#create")
    end

    it "routes to #update" do
      put("/time_chunks/1").should route_to("time_chunks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/time_chunks/1").should route_to("time_chunks#destroy", :id => "1")
    end

  end
end
