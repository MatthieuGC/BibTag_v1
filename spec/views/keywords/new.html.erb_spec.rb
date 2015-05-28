require 'rails_helper'

RSpec.describe "keywords/new", type: :view do
  before(:each) do
    assign(:keyword, Keyword.new())
  end

  it "renders new keyword form" do
    render

    assert_select "form[action=?][method=?]", keywords_path, "post" do
    end
  end
end
