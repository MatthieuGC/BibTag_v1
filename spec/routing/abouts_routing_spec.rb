require "rails_helper"

RSpec.describe AboutsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/abouts").to route_to("abouts#index")
    end

    it "routes to #new" do
      expect(:get => "/abouts/new").to route_to("abouts#new")
    end

    it "routes to #show" do
      expect(:get => "/abouts/1").to route_to("abouts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/abouts/1/edit").to route_to("abouts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/abouts").to route_to("abouts#create")
    end

    it "routes to #update" do
      expect(:put => "/abouts/1").to route_to("abouts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/abouts/1").to route_to("abouts#destroy", :id => "1")
    end

  end
end
