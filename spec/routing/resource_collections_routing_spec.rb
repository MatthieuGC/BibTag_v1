require "rails_helper"

RSpec.describe ResourceCollectionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/resource_collections").to route_to("resource_collections#index")
    end

    it "routes to #new" do
      expect(:get => "/resource_collections/new").to route_to("resource_collections#new")
    end

    it "routes to #show" do
      expect(:get => "/resource_collections/1").to route_to("resource_collections#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/resource_collections/1/edit").to route_to("resource_collections#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/resource_collections").to route_to("resource_collections#create")
    end

    it "routes to #update" do
      expect(:put => "/resource_collections/1").to route_to("resource_collections#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/resource_collections/1").to route_to("resource_collections#destroy", :id => "1")
    end

  end
end
