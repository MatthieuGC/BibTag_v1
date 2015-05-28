require "rails_helper"

RSpec.describe SurrogatesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/surrogates").to route_to("surrogates#index")
    end

    it "routes to #new" do
      expect(:get => "/surrogates/new").to route_to("surrogates#new")
    end

    it "routes to #show" do
      expect(:get => "/surrogates/1").to route_to("surrogates#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/surrogates/1/edit").to route_to("surrogates#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/surrogates").to route_to("surrogates#create")
    end

    it "routes to #update" do
      expect(:put => "/surrogates/1").to route_to("surrogates#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/surrogates/1").to route_to("surrogates#destroy", :id => "1")
    end

  end
end
