require "rails_helper"

RSpec.describe SurrogateElementsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/surrogate_elements").to route_to("surrogate_elements#index")
    end

    it "routes to #new" do
      expect(:get => "/surrogate_elements/new").to route_to("surrogate_elements#new")
    end

    it "routes to #show" do
      expect(:get => "/surrogate_elements/1").to route_to("surrogate_elements#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/surrogate_elements/1/edit").to route_to("surrogate_elements#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/surrogate_elements").to route_to("surrogate_elements#create")
    end

    it "routes to #update" do
      expect(:put => "/surrogate_elements/1").to route_to("surrogate_elements#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/surrogate_elements/1").to route_to("surrogate_elements#destroy", :id => "1")
    end

  end
end
