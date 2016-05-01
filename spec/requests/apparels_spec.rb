require 'rails_helper'

RSpec.describe "Apparels", type: :request do
  describe "GET /apparels" do
    it "works!" do
      get apparels_path
      expect(response).to have_http_status(302)
    end
  end
end
