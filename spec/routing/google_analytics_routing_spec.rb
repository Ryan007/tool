require "spec_helper"

describe GoogleAnalyticsController do
  describe "routing" do

    it "routes to #index" do
      get("/google_analytics").should route_to("google_analytics#index")
    end

    it "routes to #new" do
      get("/google_analytics/new").should route_to("google_analytics#new")
    end

    it "routes to #show" do
      get("/google_analytics/1").should route_to("google_analytics#show", :id => "1")
    end

    it "routes to #edit" do
      get("/google_analytics/1/edit").should route_to("google_analytics#edit", :id => "1")
    end

    it "routes to #create" do
      post("/google_analytics").should route_to("google_analytics#create")
    end

    it "routes to #update" do
      put("/google_analytics/1").should route_to("google_analytics#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/google_analytics/1").should route_to("google_analytics#destroy", :id => "1")
    end

  end
end
