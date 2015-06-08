require "rails_helper"

RSpec.describe HeadingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/headings").to route_to("headings#index")
    end

    it "routes to #new" do
      expect(:get => "/headings/new").to route_to("headings#new")
    end

    it "routes to #show" do
      expect(:get => "/headings/1").to route_to("headings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/headings/1/edit").to route_to("headings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/headings").to route_to("headings#create")
    end

    it "routes to #update" do
      expect(:put => "/headings/1").to route_to("headings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/headings/1").to route_to("headings#destroy", :id => "1")
    end

  end
end
