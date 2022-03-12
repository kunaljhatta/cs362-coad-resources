require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do

    let(:admin) {create(:user, :admin)}
    let(:organization_submitted) {create(:organization, :set_submitted)}
    let(:organization_rejected) {create(:organization, :set_rejected)}

    scenario "admin approves an organization from subbmited status" do
        admin.confirm
        log_in_as(admin)
        visit organization_path(organization_submitted)
        click_on "Approve"
        expect(page).to have_text('has been approved.')
    end

    scenario "admin approves an organization from rejected status" do
        admin.confirm
        log_in_as(admin)
        visit organization_path(organization_rejected)
        click_on "Approve"
        expect(page).to have_text('has been approved.')
    end
end