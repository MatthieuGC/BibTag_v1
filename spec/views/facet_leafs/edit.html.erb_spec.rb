require 'rails_helper'

RSpec.describe "facet_leafs/edit", type: :view do
  before(:each) do
    @facet_leaf = assign(:facet_leaf, FacetLeaf.create!(
      :facet_id => 1
    ))
  end

  it "renders the edit facet_leaf form" do
    render

    assert_select "form[action=?][method=?]", facet_leaf_path(@facet_leaf), "post" do

      assert_select "input#facet_leaf_facet_id[name=?]", "facet_leaf[facet_id]"
    end
  end
end
