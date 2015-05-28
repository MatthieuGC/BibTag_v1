require 'rails_helper'

RSpec.describe "imports/show", type: :view do
  before(:each) do
    @import = assign(:import, Import.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
