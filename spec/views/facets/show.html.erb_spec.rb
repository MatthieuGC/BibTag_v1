require 'rails_helper'

RSpec.describe "facets/show", type: :view do
  before(:each) do
    @facet = assign(:facet, Facet.create!(
      :facet_name => "Facet Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Facet Name/)
  end
end
