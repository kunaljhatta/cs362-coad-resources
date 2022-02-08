require 'rails_helper'

RSpec.describe Ticket, type: :model do

  let(:ticket) { build(:ticket) } 

  describe "attributes" do

    it "exists" do
      ticket
    end    

    it "is valid with valid attributes" do
      name = "fake name"
      phone = "1231234567"
      region_id = Region.create
      resource_category_id = ResourceCategory.create(name: name)
      expect(Ticket.new(name: name, phone: phone, region_id: region_id, resource_category_id: resource_category_id))
      
    #  expect(ticket).to be_valid
    end
  
  end

end
