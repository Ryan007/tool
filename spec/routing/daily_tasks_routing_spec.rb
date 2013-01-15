require "spec_helper"

describe DailyTasksController do
  describe "routing" do

    it "routes to #index" do
      get("/daily_tasks").should route_to("daily_tasks#index")
    end

    it "routes to #new" do
      get("/daily_tasks/new").should route_to("daily_tasks#new")
    end

    it "routes to #show" do
      get("/daily_tasks/1").should route_to("daily_tasks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/daily_tasks/1/edit").should route_to("daily_tasks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/daily_tasks").should route_to("daily_tasks#create")
    end

    it "routes to #update" do
      put("/daily_tasks/1").should route_to("daily_tasks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/daily_tasks/1").should route_to("daily_tasks#destroy", :id => "1")
    end

  end
end
