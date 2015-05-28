require 'rails_helper'

RSpec.describe "keywords/show", type: :view do
  before(:each) do
    @keyword = assign(:keyword, Keyword.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
