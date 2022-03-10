require 'rails_helper'

RSpec.describe 'Capturing a ticket', type: :feature do
  scenario "organization captures a ticket" do
    # given: logged in as an organization user and viewing a ticket
    ticket = create(:ticket)
    user = create(:user, :organization_user) 
    user.organization.approve
    user.confirm
    user.save!
    log_in_as(user)
    # visit "/dashboard"
    visit "/tickets/1"
    # expect(page).to have_text "Capture"

    # when: when capture button is clicked
    # then: the ticket is captured and org user is redirected to dashboard
  end
end
