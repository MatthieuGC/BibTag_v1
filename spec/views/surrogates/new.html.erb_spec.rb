require 'rails_helper'

RSpec.describe "surrogates/new", type: :view do
  before(:each) do
    assign(:surrogate, Surrogate.new())
  end

  it "renders new surrogate form" do
    render

    assert_select "form[action=?][method=?]", surrogates_path, "post" do
    end
  end
end
