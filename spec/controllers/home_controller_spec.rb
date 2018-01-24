require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  context "when user is logged in" do
    it "access index" do
      sign_in(FactoryGirl.create(:user))

      get :index
      expect(response).to have_http_status(200)
    end
  end

  context "when user isn't logged in" do
    it "access index" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
