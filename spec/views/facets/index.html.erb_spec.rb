require 'rails_helper'

RSpec.describe "facets/index", type: :view do
  before(:each) do
    assign(:facets, [
      Facet.create!(
        :facet_name => "Facet Name"
      ),
      Facet.create!(
        :facet_name => "Facet Name"
      )
    ])
  end

  it "renders a list of facets" do
    render
    assert_select "tr>td", :text => "Facet Name".to_s, :count => 2
  end
end
