require 'rails_helper'

RSpec.describe "Keywords", type: :request do
  describe "GET /keywords" do
    it "works! (now write some real specs)" do
      get keywords_path
      expect(response).to have_http_status(200)
    end
  end
end
