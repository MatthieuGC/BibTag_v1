require 'rails_helper'

RSpec.describe "surrogates_tags/show", type: :view do
  before(:each) do
    @surrogates_tag = assign(:surrogates_tag, SurrogatesTag.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
