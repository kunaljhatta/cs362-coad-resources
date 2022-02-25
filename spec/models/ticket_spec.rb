require 'rails_helper'

RSpec.describe Ticket, type: :model do

  let(:ticket) { create(:ticket) } 

  describe "attributes" do 

    it "is valid with valid attributes" do
      expect(ticket).to be_valid
    end
    
    it "is not valid without a name" do
      expect(build_stubbed(:ticket, name: nil)).to be_invalid
    end

    it "is not valid without a phone number" do 
      expect(build_stubbed(:ticket, phone: nil)).to be_invalid
    end

    it "is not valid without a region id" do
      expect(build_stubbed(:ticket, region_id: nil)).to be_invalid
    end

    it "is not valid without a resource category id" do
      expect(build_stubbed(:ticket, resource_category_id: nil)).to be_invalid
    end
  
  end

  describe "validations" do

    describe "validates length of name" do
      it { expect(ticket).to validate_length_of(:name) }
    end

    describe "validates length of description" do
      it { expect(ticket).to validate_length_of(:description) }
    end 

    it "validates plausibility of phone" do
      expect(Ticket.validators_on(:phone)).to include(PhonyPlausibleValidator)
    end

  end

  describe "associations" do
    
    describe "belongs to region" do 
      it { ticket.should belong_to(:region) }
    end

    describe "belongs to resource_category" do
      it { ticket.should belong_to(:resource_category) }
    end

    describe "may belong to organization" do
      it { ticket.should belong_to(:organization) }
    end

  end

  describe "methods" do

    it "checks if ticket is open" do 
      expect(ticket.open?).to be_truthy
      closed_ticket = build(:closed_ticket)
      expect(closed_ticket.open?).to be_falsey
    end

    it "checks if ticket is captured" do
      expect(ticket.captured?).to be_falsey
      captured_ticket = build(:captured_ticket)
      expect(captured_ticket.captured?).to be_truthy
    end

    it "to_s returns the ticket id"
  end

end
