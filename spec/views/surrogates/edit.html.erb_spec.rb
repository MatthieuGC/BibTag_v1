require 'rails_helper'

RSpec.describe "surrogates/edit", type: :view do
  before(:each) do
    @surrogate = assign(:surrogate, Surrogate.create!())
  end

  it "renders the edit surrogate form" do
    render

    assert_select "form[action=?][method=?]", surrogate_path(@surrogate), "post" do
    end
  end
end
