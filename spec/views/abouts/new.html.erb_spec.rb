require 'rails_helper'

RSpec.describe "abouts/new", type: :view do
  before(:each) do
    assign(:about, About.new())
  end

  it "renders new about form" do
    render

    assert_select "form[action=?][method=?]", abouts_path, "post" do
    end
  end
end
