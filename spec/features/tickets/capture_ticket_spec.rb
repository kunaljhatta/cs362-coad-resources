require 'rails_helper'

RSpec.describe 'Capturing a ticket', type: :feature do
  scenario "organization captures a ticket" do
    # given: logged in as an organization user and viewing a ticket
    ticket = create(:ticket)

    expect(ticket.captured?).to be_falsy
    user = create(:user, :organization_user) 
    user.organization.approve
    user.organization.save!
    user.confirm
    user.save!
    log_in_as(user)
    visit "/tickets/#{ticket.id}" 
    click_on "Release"
    visit "/tickets/#{ticket.id}" 

    # when: when capture button is clicked
    click_on "Capture"
    #expect(page).to have_text "Captue"

    # then: the ticket is captured and org user is redirected to dashboard/Tickets page
    #expect(ticket.captured?).to be_truthy
    # expect(page).to have_text "Tickes"

  end
end
