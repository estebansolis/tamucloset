require 'rails_helper'

RSpec.describe "Students", type: :request do
  describe "GET /students" do
    it "works!" do
      get students_path
      expect(response).to have_http_status(302)
    end
  end
end
