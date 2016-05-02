require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #auth" do
    it "returns http success" do
      get :auth
      expect(response).to have_http_status(:success)
    end
  end

end
