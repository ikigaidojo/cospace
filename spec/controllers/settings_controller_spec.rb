require 'rails_helper'

RSpec.describe SettingsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #basic" do
    it "returns http success" do
      get :basic
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #notifications" do
    it "returns http success" do
      get :notifications
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #payment_methods" do
    it "returns http success" do
      get :payment_methods
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #password_reset" do
    it "returns http success" do
      get :password_reset
      expect(response).to have_http_status(:success)
    end
  end

end
