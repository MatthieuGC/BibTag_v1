require 'rails_helper'

RSpec.describe "Facets", type: :request do
  describe "GET /facets" do
    it "works! (now write some real specs)" do
      get facets_path
      expect(response).to have_http_status(200)
    end
  end
end
