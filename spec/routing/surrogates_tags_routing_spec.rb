require "rails_helper"

RSpec.describe SurrogatesTagsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/surrogates_tags").to route_to("surrogates_tags#index")
    end

    it "routes to #new" do
      expect(:get => "/surrogates_tags/new").to route_to("surrogates_tags#new")
    end

    it "routes to #show" do
      expect(:get => "/surrogates_tags/1").to route_to("surrogates_tags#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/surrogates_tags/1/edit").to route_to("surrogates_tags#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/surrogates_tags").to route_to("surrogates_tags#create")
    end

    it "routes to #update" do
      expect(:put => "/surrogates_tags/1").to route_to("surrogates_tags#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/surrogates_tags/1").to route_to("surrogates_tags#destroy", :id => "1")
    end

  end
end
