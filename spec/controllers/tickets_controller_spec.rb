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
      it "redirects to the dashboard" 
    end
    
    describe "an approved organization user" do
      it "redirects to the dashboard"
    end

end
