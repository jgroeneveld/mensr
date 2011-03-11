require "spec_helper"

describe LayoutOptionsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/layout_options" }.should route_to(:controller => "layout_options", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/layout_options/new" }.should route_to(:controller => "layout_options", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/layout_options/1" }.should route_to(:controller => "layout_options", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/layout_options/1/edit" }.should route_to(:controller => "layout_options", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/layout_options" }.should route_to(:controller => "layout_options", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/layout_options/1" }.should route_to(:controller => "layout_options", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/layout_options/1" }.should route_to(:controller => "layout_options", :action => "destroy", :id => "1")
    end

  end
end
