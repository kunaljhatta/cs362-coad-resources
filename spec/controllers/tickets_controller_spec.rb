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
      unapproved_org_user = create(:user, :organization_user)
      expect(unapproved_org_user.organization.status).to eq("submitted")
      sign_in(unapproved_org_user)

      get :show, params: {id: 'fake'}
      expect(response).to redirect_to("http://test.host/users/sign_in")
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
  
  describe "an approved organization user" do
    it "redirects to the dashboard" do
      approved_org_user = create(:user, :organization_user)
      approved_org_user.organization.approve
      expect(approved_org_user.organization.status).to eq("approved")
      sign_in(approved_org_user)

      delete :destroy, params: {id: 'fake'}
      expect(response).to redirect_to("http://test.host/users/sign_in")
    end
  end

end
