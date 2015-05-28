require 'rails_helper'

RSpec.describe "resource_collections/index", type: :view do
  before(:each) do
    assign(:resource_collections, [
      ResourceCollection.create!(),
      ResourceCollection.create!()
    ])
  end

  it "renders a list of resource_collections" do
    render
  end
end
