require "spec_helper"

describe CallBacksController do
  describe "webhook callback route" do
    it "routes to " do
       post("/drblinken/VisualStats/notify").should route_to("call_backs#notify", username: "drblinken", repository: "VisualStats")
    end
  end
  
  describe "scaffolded default routing" do

    it "routes to #index" do
      get("/call_backs").should route_to("call_backs#index")
    end

    it "routes to #new" do
      get("/call_backs/new").should route_to("call_backs#new")
    end

    it "routes to #show" do
      get("/call_backs/1").should route_to("call_backs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/call_backs/1/edit").should route_to("call_backs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/call_backs").should route_to("call_backs#create")
    end

    it "routes to #update" do
      put("/call_backs/1").should route_to("call_backs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/call_backs/1").should route_to("call_backs#destroy", :id => "1")
    end

  end
end
