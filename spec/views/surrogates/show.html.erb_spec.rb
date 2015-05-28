require 'rails_helper'

RSpec.describe "surrogates/show", type: :view do
  before(:each) do
    @surrogate = assign(:surrogate, Surrogate.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
