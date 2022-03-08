require 'rails_helper'

RSpec.describe 'Deleting a Ticket', type: :feature do
  scenario "admin deletes a ticket" do
    # given: logged in as admin and on a page of a ticket
    visit "/"
    admin = create(:user, :admin)
    expect(admin.role).to eq("admin")
    log_in_as(admin)
    visit "/dashboard"
    expect(page).to have_text "Tickets"

    # when: admin clicks 'delete'
    # then: ticket should be deleted and admin is redirected to
    #       the dashboard
  end
end
