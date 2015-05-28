require 'rails_helper'

RSpec.describe "surrogate_elements/new", type: :view do
  before(:each) do
    assign(:surrogate_element, SurrogateElement.new())
  end

  it "renders new surrogate_element form" do
    render

    assert_select "form[action=?][method=?]", surrogate_elements_path, "post" do
    end
  end
end
