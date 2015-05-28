require 'rails_helper'

RSpec.describe "imports/index", type: :view do
  before(:each) do
    assign(:imports, [
      Import.create!(),
      Import.create!()
    ])
  end

  it "renders a list of imports" do
    render
  end
end
