require 'rails_helper'

RSpec.describe "se_values/index", type: :view do
  before(:each) do
    assign(:se_values, [
      SeValue.create!(),
      SeValue.create!()
    ])
  end

  it "renders a list of se_values" do
    render
  end
end
