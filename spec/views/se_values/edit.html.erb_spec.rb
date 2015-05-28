require 'rails_helper'

RSpec.describe "se_values/edit", type: :view do
  before(:each) do
    @se_value = assign(:se_value, SeValue.create!())
  end

  it "renders the edit se_value form" do
    render

    assert_select "form[action=?][method=?]", se_value_path(@se_value), "post" do
    end
  end
end
