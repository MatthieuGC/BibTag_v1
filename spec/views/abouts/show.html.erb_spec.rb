require 'rails_helper'

RSpec.describe "abouts/show", type: :view do
  before(:each) do
    @about = assign(:about, About.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
