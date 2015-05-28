require 'rails_helper'

RSpec.describe "surrogate_elements/index", type: :view do
  before(:each) do
    assign(:surrogate_elements, [
      SurrogateElement.create!(),
      SurrogateElement.create!()
    ])
  end

  it "renders a list of surrogate_elements" do
    render
  end
end
