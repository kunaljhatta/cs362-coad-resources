require 'rails_helper'

RSpec.describe 'Deleting a Ticket', type: :feature do
  scenario "admin deletes a ticket" do
    # given: logged in as admin and on a page of a ticket
    admin = create(:user, :admin)
    admin.confirm
    expect(admin.role).to eq("admin")
    log_in_as(admin)
    visit "/dashboard"
    expect(page).to have_text "Tickets"
    ticket = create(:ticket)
    visit "/tickets/1"
    expect(page).to have_text "Delete"

    # # when: admin clicks 'Delete'
    click_on "Delete"

    # then: ticket should be deleted and admin is redirected to the dashboard
    expect(page).to have_text "was deleted."

  end
end
