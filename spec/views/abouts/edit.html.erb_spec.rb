require 'rails_helper'

RSpec.describe "abouts/edit", type: :view do
  before(:each) do
    @about = assign(:about, About.create!())
  end

  it "renders the edit about form" do
    render

    assert_select "form[action=?][method=?]", about_path(@about), "post" do
    end
  end
end
