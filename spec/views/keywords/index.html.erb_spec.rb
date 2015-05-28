require 'rails_helper'

RSpec.describe "keywords/index", type: :view do
  before(:each) do
    assign(:keywords, [
      Keyword.create!(),
      Keyword.create!()
    ])
  end

  it "renders a list of keywords" do
    render
  end
end
