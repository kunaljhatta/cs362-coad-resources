require 'rails_helper'

RSpec.describe 'Deleting a Ticket', type: :feature do
  scenario "admin deletes a ticket" do
    # given: logged in as admin and on a page of a ticket
    #-- admin = create(:user)
    #-- log_in_as(admin)
    #-- visit(tickets_page)

    # when: admin clicks 'delete'
    # then: ticket should be deleted and admin is redirected to
    #       the dashboard
  end
end
