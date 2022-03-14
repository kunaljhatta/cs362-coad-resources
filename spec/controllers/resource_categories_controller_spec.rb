require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do

  describe "user who is not logged in" do
    
    it "sends user to sign in screen" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
      get :index, params: {id: 'fake_id'}
      expect(response).to redirect_to(new_user_session_path)
      delete :index
      expect(response).to redirect_to(new_user_session_path)
      post :index
      expect(response).to redirect_to(new_user_session_path)
      post :index, params: {id: 'fake_id'}
      
      patch :activate, params: {id: 'not_real'}
      expect(response).to redirect_to(new_user_session_path)
      patch :deactivate, params: {id: 'not_real'}
      expect(response).to redirect_to(new_user_session_path)

      get :new
      expect(response).to redirect_to(new_user_session_path)
      
      patch :edit, params: {id: 'fake_id'}
      expect(response).to redirect_to(new_user_session_path)

      get :create
      expect(response).to redirect_to(new_user_session_path)
      post :create, params: {name: 'fake name' }
      expect(response).to redirect_to(new_user_session_path)
    end

  end

  describe "organization_user" do
    it "redirects to the dashboard" do
      org_user = create(:user, :organization_user)
      org_user.confirm
      sign_in(org_user)

      get :index
      expect(response).to redirect_to(dashboard_path)
      get :index, params: {id: 'fake_id'}
      expect(response).to redirect_to(dashboard_path)
      delete :index
      expect(response).to redirect_to(dashboard_path)
      post :index
      expect(response).to redirect_to(dashboard_path)
      post :index, params: {id: 'fake_id'}
      
      patch :activate, params: {id: 'not_real'}
      expect(response).to redirect_to(dashboard_path)
      patch :deactivate, params: {id: 'not_real'}
      expect(response).to redirect_to(dashboard_path)

      get :new
      expect(response).to redirect_to(dashboard_path)
      
      patch :edit, params: {id: 'fake_id'}
      expect(response).to redirect_to(dashboard_path)

      get :create
      expect(response).to redirect_to(dashboard_path)
      post :create, params: {name: 'fake name' }
      expect(response).to redirect_to(dashboard_path)
    end

  end

  describe "signed in admin" do
    let(:hash_cat) { attributes_for (:resource_category)}
    let(:cat) {create(:resource_category, unique_name: true)}
    let(:deleted_cat) { create(:resource_category, unique_name: true)}
    let(:admin) { create(:user, :admin)}
    it "sends an admin somewhere" do
      admin.confirm
      sign_in(admin)
      get :index
      expect(response).to be_ok
      get :index, params: {id: 'fake_id'}
      expect(response).to be_ok
      delete :index, params: {id: deleted_cat.id}
      expect(response).to be_ok
      post :index
      expect(response).to be_ok
      post :index, params: {id: 'fake_id'}
      
      patch :activate, params: {id: cat.id}
      expect(response).to be_redirect
      patch :deactivate, params: {id: cat.id}
      expect(response).to be_redirect
      get :new
      expect(response).to be_ok
      
      patch :edit, params: {id: cat.id}
      expect(response).to be_ok
      
      get :create, params: { :resource_category => { name:nil } }
      expect(response).to be_ok
      puts "hash cat: #{hash_cat}"
      post :create, params: { :resource_category => hash_cat}
      expect(response).to be_redirect
    end
  end
end
