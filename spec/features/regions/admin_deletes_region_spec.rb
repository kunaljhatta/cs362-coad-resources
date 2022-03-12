require 'rails_helper'

RSpec.describe 'Deleting a Region', type: :feature do
  scenario "as an admin succeeds" do
    create(:region, name: "REGION_TO_DELETE")
    user = create(:user, :admin)
    user.confirm
    log_in_as(user)
    visit '/regions'

    click_on 'REGION_TO_DELETE'
    click_on 'Delete'
    expect(page).to have_text("Region REGION_TO_DELETE was deleted.")
  end
end