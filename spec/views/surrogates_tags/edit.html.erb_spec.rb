require 'rails_helper'

RSpec.describe "surrogates_tags/edit", type: :view do
  before(:each) do
    @surrogates_tag = assign(:surrogates_tag, SurrogatesTag.create!())
  end

  it "renders the edit surrogates_tag form" do
    render

    assert_select "form[action=?][method=?]", surrogates_tag_path(@surrogates_tag), "post" do
    end
  end
end
