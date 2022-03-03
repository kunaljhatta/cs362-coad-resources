require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do
    describe "a non logged in person" do 
        it "redirects to the sign in screen" do 
            get :index
            expect(response). to redirect_to(new_user_session_path)
            get :new
            expect(response). to redirect_to(new_user_session_path)
            post :create
            expect(response). to redirect_to(new_user_session_path)
            get :edit, params: {id: "FAKE"}
            expect(response). to redirect_to(new_user_session_path)
            put :update, params: {id: "FAKE"}
            expect(response). to redirect_to(new_user_session_path)
            patch :update, params: {id: "FAKE"}
            expect(response). to redirect_to(new_user_session_path)
            get :show, params: {id: "FAKE"}
            expect(response). to redirect_to(new_user_session_path)
            post :approve, params: {id: "FAKE"}
            expect(response). to redirect_to(new_user_session_path)
            post :reject, params: {id: "FAKE"}
            expect(response). to redirect_to(new_user_session_path)
        end 
    end   

    describe  "a organization user" do 
        it "redirects to the sign in screen" do
            organization_user = create(:user)
            organization_user.confirm
            # organization_user.organization.approve
            sign_in(organization_user)
            # get :index
            # expect(response). to redirect_to(new_user_session_path)
            # get :new
            # expect(response). to redirect_to(new_user_session_path)
            # post :create
            # expect(response). to redirect_to(new_user_session_path)
            # get :edit, params: {id: "FAKE"}
            # expect(response). to redirect_to(new_user_session_path)
            # put :update, params: {id: "FAKE"}
            # expect(response). to redirect_to(new_user_session_path)
            # patch :update, params: {id: "FAKE"}
            # expect(response). to redirect_to(new_user_session_path)
            # get :show, params: {id: "FAKE"}
            # expect(response). to redirect_to(new_user_session_path)
            # post :approve, params: {id: "FAKE"}
            # expect(response). to redirect_to(new_user_session_path)
            # post :reject, params: {id: "FAKE"}
            # expect(response). to redirect_to(new_user_session_path)
        end
    end 
end
