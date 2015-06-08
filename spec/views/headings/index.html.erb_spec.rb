require 'rails_helper'

RSpec.describe "headings/index", type: :view do
  before(:each) do
    assign(:headings, [
      Heading.create!(
        :heading_name => "Heading Name",
        :facet_id => 1
      ),
      Heading.create!(
        :heading_name => "Heading Name",
        :facet_id => 1
      )
    ])
  end

  it "renders a list of headings" do
    render
    assert_select "tr>td", :text => "Heading Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
