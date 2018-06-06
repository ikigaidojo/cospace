require 'rails_helper'

RSpec.describe MailerController, type: :controller do

  describe "GET #UserMailer" do
    it "returns http success" do
      get :UserMailer
      expect(response).to have_http_status(:success)
    end
  end

end
