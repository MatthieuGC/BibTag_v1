require 'rails_helper'

RSpec.describe "facet_leafs/show", type: :view do
  before(:each) do
    @facet_leaf = assign(:facet_leaf, FacetLeaf.create!(
      :facet_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
  end
end
