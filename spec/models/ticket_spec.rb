require 'rails_helper'

RSpec.describe Ticket, type: :model do

  let(:ticket) { create(:ticket) }
  let(:category) { create(:resource_category, unique_name:true) }
  let(:organization) { create(:organization) }
  let(:region) { create(:region, unique_name: true) }

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
      it { expect(ticket).to belong_to(:region) }
    end

    describe "belongs to resource_category" do
      it { expect(ticket).to belong_to(:resource_category) }
    end

    describe "may belong to organization" do
      it { expect(ticket).to belong_to(:organization) }
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

    it "to_s returns the ticket id" do
      expect(ticket.to_s).to eq("Ticket #{ticket.id}")
    end

  end

  describe "scope" do

    it "ticket.open returns all open tickets with no org_id" do
      # Create 3 tickets all closed: false, 2 with no org_id
      # expect 2 from count of scope
      # Change org_id of one ticket to nil
      # expect 1 from count of scope
    end

    it "ticket.closed returns all closed tickets" do
      # create 3 tickets, one closed: true, two closed: false
      # expect 1 from scope
      #swap one of closed:false
      # expect 2 from scope
    end

    it "ticket.all_organization returns all open tickets with an org_id" do
      # create org with with org_id
      organization = :organization
      # create 3 tickets, two with org_id, one without org_id
      # expect 2 from scope
      # swap org_id to nil
      # expect 1 from scope
    end

    it "ticket.organization(org_id) returns open tickets from that organization" do
      # create org with with org_id
      organization = :organization
      # create 3 tickets, with different org_id than test org_id, all closed: false
      # expect 0 from scope
      # flip 2 tickets to same org_id
      # expect 2 from scope
      # flip 1 ticket with org_id to closed:true
      # expect 1 from scope
    end

    it "ticket.closed_organization(org_id) returns closed tickets from that organization" do
      # create org with with org_id
      organization = :organization
      # create 3 tickets, with different org_id than test org_id, all closed: true
      # expect 0 from scope
      # flip 2 tickets to same org_id
      # expect 2 from scope
      # flip 1 ticket with org_id to closed:false
      # expect 1 from scope
    end

    it "ticket.region(reg_id) returns all tickets under that region" do
      # create region with reg_id
      region = :region
      # create 3 tickets, 1 with same reg_id and 2 with different reg_id
      # expect 1 from scope
      # flip both other tickets to same reg_id
      # expect 3 from scope
    end

    it "ticket.resource_category(cat_id) returns all tickets under that resource_category" do
      # create resource_category with cat_id
      category = :resource_category
      # create 3 tickets, 2 with same cat_id and 1 with different cat_id
      # expect 2 from scope
      # switch 1 to different cat_id
      # expect 1 from scope
    end

  end

end
