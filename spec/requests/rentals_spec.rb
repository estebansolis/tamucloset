require 'rails_helper'

RSpec.describe "Rentals", type: :request do
  describe "GET /rentals" do
    it "works!" do
      get rentals_path
      expect(response).to have_http_status(302)
    end
  end
end
