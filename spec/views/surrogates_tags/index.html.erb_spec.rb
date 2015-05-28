require 'rails_helper'

RSpec.describe "surrogates_tags/index", type: :view do
  before(:each) do
    assign(:surrogates_tags, [
      SurrogatesTag.create!(),
      SurrogatesTag.create!()
    ])
  end

  it "renders a list of surrogates_tags" do
    render
  end
end
