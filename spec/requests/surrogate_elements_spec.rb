require 'rails_helper'

RSpec.describe "SurrogateElements", type: :request do
  describe "GET /surrogate_elements" do
    it "works! (now write some real specs)" do
      get surrogate_elements_path
      expect(response).to have_http_status(200)
    end
  end
end
