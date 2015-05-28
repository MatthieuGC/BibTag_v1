require 'rails_helper'

RSpec.describe "resource_collections/edit", type: :view do
  before(:each) do
    @resource_collection = assign(:resource_collection, ResourceCollection.create!())
  end

  it "renders the edit resource_collection form" do
    render

    assert_select "form[action=?][method=?]", resource_collection_path(@resource_collection), "post" do
    end
  end
end
