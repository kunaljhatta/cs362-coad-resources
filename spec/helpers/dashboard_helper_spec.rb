require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the DashboardHelper. For example:
#
# describe DashboardHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe DashboardHelper, type: :helper do

  describe "methods" do
    let(:org) { build_stubbed(:organization) }
    let(:admin) { build_stubbed(:user, :admin) }
    let(:user) { build_stubbed(:user)}


    it "prints out a different string based on the permissions level of the user" do
      expect(dashboard_for(admin)).to eq('admin_dashboard')
      org_user = org.users.build
      expect(dashboard_for(org_user)).to eq('organization_submitted_dashboard')
      org.approve
      org_approved = org.users.build
      expect(dashboard_for(org_approved)).to eq('organization_approved_dashboard')
      expect(dashboard_for(user)).to eq('create_application_dashboard')
    end
  end
end
