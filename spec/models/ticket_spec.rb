require 'rails_helper'

RSpec.describe Ticket, type: :model do

  #let(:ticket) { build(:ticket) } 

  describe "attributes" do 

    it "is valid with valid attributes" do
      name = "fake name"
      phone = "1231234567"
      region_id = Region.create(name: "Bend")
      resource_category_id = ResourceCategory.create(name: "Fake Name")
      ticket = Ticket.create(name: name, phone: phone, region_id: region_id, resource_category_id: resource_category_id)

      # expect(ticket).to be_valid
    end
    
    it "is not valid without a name"
    it "is not valid without a phone number"
    it "is not valid without a region id"
    it "is not valid without a resource category id"
  
  end

end
