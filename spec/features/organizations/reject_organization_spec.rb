require 'rails_helper'

RSpec.describe 'Rejecting an organization', type: :feature do

    let(:admin) {create(:user, :admin)}
    let(:organization_submitted) {create(:organization, :set_submitted)}

    scenario "admin rejects a submitted organization" do
        admin.confirm
        log_in_as(admin)
        visit organization_path(organization_submitted)
        click_on "Reject"
        expect(page).to have_text('has been rejected.')
    end
end