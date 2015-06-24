require 'rails_helper'

RSpec.describe "abouts/index", type: :view do
  before(:each) do
    assign(:abouts, [
      About.create!(),
      About.create!()
    ])
  end

  it "renders a list of abouts" do
    render
  end
end
