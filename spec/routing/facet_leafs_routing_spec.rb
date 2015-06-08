require "rails_helper"

RSpec.describe FacetLeafsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/facet_leafs").to route_to("facet_leafs#index")
    end

    it "routes to #new" do
      expect(:get => "/facet_leafs/new").to route_to("facet_leafs#new")
    end

    it "routes to #show" do
      expect(:get => "/facet_leafs/1").to route_to("facet_leafs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/facet_leafs/1/edit").to route_to("facet_leafs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/facet_leafs").to route_to("facet_leafs#create")
    end

    it "routes to #update" do
      expect(:put => "/facet_leafs/1").to route_to("facet_leafs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/facet_leafs/1").to route_to("facet_leafs#destroy", :id => "1")
    end

  end
end
