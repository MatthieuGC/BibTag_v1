require 'rails_helper'

RSpec.describe "facet_leafs/new", type: :view do
  before(:each) do
    assign(:facet_leaf, FacetLeaf.new(
      :facet_id => 1
    ))
  end

  it "renders new facet_leaf form" do
    render

    assert_select "form[action=?][method=?]", facet_leafs_path, "post" do

      assert_select "input#facet_leaf_facet_id[name=?]", "facet_leaf[facet_id]"
    end
  end
end
