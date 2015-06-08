require 'rails_helper'

RSpec.describe "headings/new", type: :view do
  before(:each) do
    assign(:heading, Heading.new(
      :heading_name => "MyString",
      :facet_id => 1
    ))
  end

  it "renders new heading form" do
    render

    assert_select "form[action=?][method=?]", headings_path, "post" do

      assert_select "input#heading_heading_name[name=?]", "heading[heading_name]"

      assert_select "input#heading_facet_id[name=?]", "heading[facet_id]"
    end
  end
end
