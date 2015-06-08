require 'rails_helper'

RSpec.describe "headings/edit", type: :view do
  before(:each) do
    @heading = assign(:heading, Heading.create!(
      :heading_name => "MyString",
      :facet_id => 1
    ))
  end

  it "renders the edit heading form" do
    render

    assert_select "form[action=?][method=?]", heading_path(@heading), "post" do

      assert_select "input#heading_heading_name[name=?]", "heading[heading_name]"

      assert_select "input#heading_facet_id[name=?]", "heading[facet_id]"
    end
  end
end
