require 'rails_helper'

RSpec.describe "SurrogatesTags", type: :request do
  describe "GET /surrogates_tags" do
    it "works! (now write some real specs)" do
      get surrogates_tags_path
      expect(response).to have_http_status(200)
    end
  end
end
