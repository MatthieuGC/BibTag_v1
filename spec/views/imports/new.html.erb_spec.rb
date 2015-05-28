require 'rails_helper'

RSpec.describe "imports/new", type: :view do
  before(:each) do
    assign(:import, Import.new())
  end

  it "renders new import form" do
    render

    assert_select "form[action=?][method=?]", imports_path, "post" do
    end
  end
end
