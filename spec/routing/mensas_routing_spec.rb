require "spec_helper"

describe MensasController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/mensas" }.should route_to(:controller => "mensas", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/mensas/new" }.should route_to(:controller => "mensas", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/mensas/1" }.should route_to(:controller => "mensas", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/mensas/1/edit" }.should route_to(:controller => "mensas", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/mensas" }.should route_to(:controller => "mensas", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/mensas/1" }.should route_to(:controller => "mensas", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/mensas/1" }.should route_to(:controller => "mensas", :action => "destroy", :id => "1")
    end

  end
end
