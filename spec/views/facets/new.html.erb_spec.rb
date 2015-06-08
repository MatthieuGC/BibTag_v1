require 'rails_helper'

RSpec.describe "facets/new", type: :view do
  before(:each) do
    assign(:facet, Facet.new(
      :facet_name => "MyString"
    ))
  end

  it "renders new facet form" do
    render

    assert_select "form[action=?][method=?]", facets_path, "post" do

      assert_select "input#facet_facet_name[name=?]", "facet[facet_name]"
    end
  end
end
