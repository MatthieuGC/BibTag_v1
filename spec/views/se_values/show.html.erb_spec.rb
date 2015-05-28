require 'rails_helper'

RSpec.describe "se_values/show", type: :view do
  before(:each) do
    @se_value = assign(:se_value, SeValue.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
