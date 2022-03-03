require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

  describe "a non logged in person" do
    it "redirects to the log-in screen" do
      get :show, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_path)
      post :capture, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_path)
      post :release, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_path)
      patch :close, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_path)
      delete :destroy, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_path)
    end
  end

  describe "an unapproved organization user" do
    it "redirects to the dashboard" do
      unapproved_org = create(:organization)
      expect(unapproved_org.status).to eq("submitted")
      # sign_in(unapproved_org)
      # log in user as unapproved organization
      # confirm this
      # check that this user is redirected 
      # if they try to do something they shouldn't be able to do

      # show
      # capture
      # release
      # close
      # destroy
    end
  end
  
  describe "an approved organization user" do
    it "redirects to the dashboard" do
      # log in as an approved organization
      # destroy


    #   approved_user = create(:organization)
    #   expect(approved_org.status).to eq("approved")
    #   sign_in(approved_org)
    #   delete :destroy, params: {id: 'fake'}
    #   expect(response).to redirect_to(dashboard_path)
    end
  end

end
