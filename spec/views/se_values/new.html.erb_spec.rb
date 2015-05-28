require 'rails_helper'

RSpec.describe "se_values/new", type: :view do
  before(:each) do
    assign(:se_value, SeValue.new())
  end

  it "renders new se_value form" do
    render

    assert_select "form[action=?][method=?]", se_values_path, "post" do
    end
  end
end
