require 'rails_helper'

RSpec.describe "surrogates_tags/new", type: :view do
  before(:each) do
    assign(:surrogates_tag, SurrogatesTag.new())
  end

  it "renders new surrogates_tag form" do
    render

    assert_select "form[action=?][method=?]", surrogates_tags_path, "post" do
    end
  end
end
