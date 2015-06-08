require 'rails_helper'

RSpec.describe "FacetLeafs", type: :request do
  describe "GET /facet_leafs" do
    it "works! (now write some real specs)" do
      get facet_leafs_path
      expect(response).to have_http_status(200)
    end
  end
end
