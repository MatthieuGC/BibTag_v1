require 'rails_helper'

RSpec.describe "surrogate_elements/show", type: :view do
  before(:each) do
    @surrogate_element = assign(:surrogate_element, SurrogateElement.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
