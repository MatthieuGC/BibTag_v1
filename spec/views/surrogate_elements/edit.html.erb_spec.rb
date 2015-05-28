require 'rails_helper'

RSpec.describe "surrogate_elements/edit", type: :view do
  before(:each) do
    @surrogate_element = assign(:surrogate_element, SurrogateElement.create!())
  end

  it "renders the edit surrogate_element form" do
    render

    assert_select "form[action=?][method=?]", surrogate_element_path(@surrogate_element), "post" do
    end
  end
end
