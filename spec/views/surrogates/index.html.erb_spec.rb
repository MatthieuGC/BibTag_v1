require 'rails_helper'

RSpec.describe "surrogates/index", type: :view do
  before(:each) do
    assign(:surrogates, [
      Surrogate.create!(),
      Surrogate.create!()
    ])
  end

  it "renders a list of surrogates" do
    render
  end
end
