require 'rails_helper'

RSpec.describe "facet_leafs/index", type: :view do
  before(:each) do
    assign(:facet_leafs, [
      FacetLeaf.create!(
        :facet_id => 1
      ),
      FacetLeaf.create!(
        :facet_id => 1
      )
    ])
  end

  it "renders a list of facet_leafs" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
