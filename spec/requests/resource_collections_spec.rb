require 'rails_helper'

RSpec.describe "ResourceCollections", type: :request do
  describe "GET /resource_collections" do
    it "works! (now write some real specs)" do
      get resource_collections_path
      expect(response).to have_http_status(200)
    end
  end
end
