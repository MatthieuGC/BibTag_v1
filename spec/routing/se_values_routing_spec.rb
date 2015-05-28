require "rails_helper"

RSpec.describe SeValuesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/se_values").to route_to("se_values#index")
    end

    it "routes to #new" do
      expect(:get => "/se_values/new").to route_to("se_values#new")
    end

    it "routes to #show" do
      expect(:get => "/se_values/1").to route_to("se_values#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/se_values/1/edit").to route_to("se_values#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/se_values").to route_to("se_values#create")
    end

    it "routes to #update" do
      expect(:put => "/se_values/1").to route_to("se_values#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/se_values/1").to route_to("se_values#destroy", :id => "1")
    end

  end
end
