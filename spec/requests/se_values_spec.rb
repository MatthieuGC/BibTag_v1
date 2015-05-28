require 'rails_helper'

RSpec.describe "SeValues", type: :request do
  describe "GET /se_values" do
    it "works! (now write some real specs)" do
      get se_values_path
      expect(response).to have_http_status(200)
    end
  end
end
