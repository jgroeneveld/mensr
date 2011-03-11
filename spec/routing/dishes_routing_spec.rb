require "spec_helper"

describe DishesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/dishes" }.should route_to(:controller => "dishes", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/dishes/new" }.should route_to(:controller => "dishes", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/dishes/1" }.should route_to(:controller => "dishes", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/dishes/1/edit" }.should route_to(:controller => "dishes", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/dishes" }.should route_to(:controller => "dishes", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/dishes/1" }.should route_to(:controller => "dishes", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/dishes/1" }.should route_to(:controller => "dishes", :action => "destroy", :id => "1")
    end

  end
end
