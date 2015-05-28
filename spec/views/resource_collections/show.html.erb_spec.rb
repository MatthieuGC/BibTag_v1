require 'rails_helper'

RSpec.describe "resource_collections/show", type: :view do
  before(:each) do
    @resource_collection = assign(:resource_collection, ResourceCollection.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
