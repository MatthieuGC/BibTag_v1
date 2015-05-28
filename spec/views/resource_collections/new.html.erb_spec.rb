require 'rails_helper'

RSpec.describe "resource_collections/new", type: :view do
  before(:each) do
    assign(:resource_collection, ResourceCollection.new())
  end

  it "renders new resource_collection form" do
    render

    assert_select "form[action=?][method=?]", resource_collections_path, "post" do
    end
  end
end
