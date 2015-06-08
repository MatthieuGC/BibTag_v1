require 'rails_helper'

RSpec.describe "facets/edit", type: :view do
  before(:each) do
    @facet = assign(:facet, Facet.create!(
      :facet_name => "MyString"
    ))
  end

  it "renders the edit facet form" do
    render

    assert_select "form[action=?][method=?]", facet_path(@facet), "post" do

      assert_select "input#facet_facet_name[name=?]", "facet[facet_name]"
    end
  end
end
