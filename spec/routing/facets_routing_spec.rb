require "rails_helper"

RSpec.describe FacetsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/facets").to route_to("facets#index")
    end

    it "routes to #new" do
      expect(:get => "/facets/new").to route_to("facets#new")
    end

    it "routes to #show" do
      expect(:get => "/facets/1").to route_to("facets#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/facets/1/edit").to route_to("facets#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/facets").to route_to("facets#create")
    end

    it "routes to #update" do
      expect(:put => "/facets/1").to route_to("facets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/facets/1").to route_to("facets#destroy", :id => "1")
    end

  end
end
