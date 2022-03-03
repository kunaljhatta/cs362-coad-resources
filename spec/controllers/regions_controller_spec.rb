require 'rails_helper'

RSpec.describe RegionsController, type: :controller do
    describe "a non logged in person" do
        it "redirects to the sign in screen" do 
            get :index
            expect(response).to redirect_to(new_user_session_path)
            get :show, params: {id: 'FAKE'}
            expect(response).to redirect_to(new_user_session_path)
            get :new
            expect(response).to redirect_to(new_user_session_path)
            post :create 
            expect(response).to redirect_to(new_user_session_path)
            get :edit, params: {id: 'FAKE'}
            expect(response).to redirect_to(new_user_session_path)
            delete :destroy, params: {id: 'FAKE'}
            expect(response).to redirect_to(new_user_session_path)
            patch :update, params: {id: 'FAKE'}
            expect(response).to redirect_to(new_user_session_path)
            put :update, params: {id: 'FAKE'}
            expect(response).to redirect_to(new_user_session_path)
        end
    end  
    
    describe "logged in organization user" do
        it "redirects to dashboard" do
            organization_user = build(:user, :organization_user)
            organization_user.confirm
            sign_in(organization_user)
            get :index
            expect(response).to redirect_to(dashboard_url)
            get :show, params: {id: 'fake'}
            expect(response).to redirect_to(dashboard_url)
            get :new
            expect(response).to redirect_to(dashboard_url)
            post :create
            expect(response).to redirect_to(dashboard_url)
            get :edit, params: {id: 'fake'}
            expect(response).to redirect_to(dashboard_url)
            delete :destroy, params: {id: 'FAKE'}
            expect(response).to redirect_to(dashboard_url)
            patch :update, params: {id: 'FAKE'}
            expect(response).to redirect_to(dashboard_url)
            put :update, params: {id: 'FAKE'}
            expect(response).to redirect_to(dashboard_url)
        end
    end
end
