require 'rails_helper'

RSpec.describe 'Releasing a ticket by an', type: :feature do
  scenario "organization releases a ticket" do
    # given: logged in as an organization user and viewing a ticket
    ticket = create(:ticket)
    ticket.organization = nil
    expect(ticket.captured?).to be_falsy
    user = create(:user, :organization_user) 
    user.organization.approve
    user.organization.save!
    user.confirm
    user.save!

    ticket.organization = user.organization
    expect(ticket.captured?).to be_truthy

    log_in_as(user)
    visit "/tickets/#{ticket.id}" 


    # when: when release button is clicked
    click_on "Release"

    # then: the ticket is released and org user is redirected to dashboard/Tickets page
    #expect(ticket.captured?).to be_falsy
    expect(page).to have_text "Tickets"

  end
end
