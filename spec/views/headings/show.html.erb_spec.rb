require 'rails_helper'

RSpec.describe "headings/show", type: :view do
  before(:each) do
    @heading = assign(:heading, Heading.create!(
      :heading_name => "Heading Name",
      :facet_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Heading Name/)
    expect(rendered).to match(/1/)
  end
end
