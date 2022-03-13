require 'rails_helper'

RSpec.describe Ticket, type: :model do

  let(:ticket) { create(:ticket) }
  let(:captured_ticket) { build(:captured_ticket) }
  let(:category) { create(:resource_category, unique_name:true) }
  let(:organization) { build(:organization, unique_email: true) }
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
      expect(captured_ticket.captured?).to be_truthy
    end

    it "to_s returns the ticket id" do
      expect(ticket.to_s).to eq("Ticket #{ticket.id}")
    end

  end

  describe "scope" do

    it "ticket.open returns all open tickets with no org_id" do
      
      ticket1 = create(:ticket, organization_id: nil)
      ticket2 = create(:ticket, organization_id: nil)
      ticket3 = create(:ticket)
      
      expect(Ticket.open.count).to eq(2)
      
      ticket2.organization_id=1
      ticket2.save!
      
      expect(Ticket.open.count).to eq(1)
    end

    it "ticket.closed returns all closed tickets" do
      
      ticket1 = create(:closed_ticket)
      ticket2 = create(:ticket)
      ticket3 = create(:ticket)
      
      expect(Ticket.closed.count).to eq(1)
      
      ticket2.closed = true
      ticket2.save!
      
      expect(Ticket.closed.count).to eq(2)
    end

    it "ticket.all_organization returns all open tickets with an org_id" do
      
      ticket1 = create(:ticket)
      ticket2 = create(:ticket)
      ticket3 = create(:ticket, organization_id: nil)
      
      expect(Ticket.all_organization.count).to eq(2)
      
      ticket2.organization=nil
      ticket2.save!
      
      expect(Ticket.all_organization.count).to eq(1)
    end

    it "ticket.organization(org_id) returns open tickets from that organization" do
      
      org = create(:organization)
      org_id = org.id
      ticket1 = create(:ticket, organization_id:2)
      ticket2 = create(:ticket, organization_id:2)
      ticket3 = create(:ticket, organization_id:2)
      
      expect(Ticket.organization(org_id).count).to eq(0)
      
      
      ticket1.organization_id = org_id
      ticket1.save!
      ticket2.organization_id = org_id
      ticket2.save!
      
      expect(Ticket.organization(org_id).count).to eq(2)
      
      ticket1.closed = true
      ticket1.save!
      
      expect(Ticket.organization(org_id).count).to eq(1)
    end

    it "ticket.closed_organization(org_id) returns closed tickets from that organization" do
      org = create(:organization)
      org_id = org.id
      
      ticket1 = create(:closed_ticket, organization_id:2)
      ticket2 = create(:closed_ticket, organization_id:2)
      ticket3 = create(:closed_ticket, organization_id:2)
      
      expect(Ticket.closed_organization(org_id).count).to eq(0)
      
      ticket1.organization_id = org_id
      ticket1.save!
      ticket2.organization_id = org_id
      ticket2.save!
      
      expect(Ticket.closed_organization(org_id).count).to eq(2)
      
      ticket1.closed = false
      ticket1.save!
      
      expect(Ticket.closed_organization(org_id).count).to eq(1)
    end

    it "ticket.region(reg_id) returns all tickets under that region" do
      
      reg_id = region.id
      ticket1 = create(:ticket, region_id: reg_id)
      ticket2 = create(:ticket)
      ticket3 = create(:ticket)
      
      expect(Ticket.region(reg_id).count).to eq(1)
      
      ticket2.region_id = reg_id
      ticket2.save!
      ticket3.region_id = reg_id
      ticket3.save!
      
      expect(Ticket.region(reg_id).count).to eq(3)
    end

    it "ticket.resource_category(cat_id) returns all tickets under that resource_category" do
      
      cat_id = category.id
      new_category = create(:resource_category, unique_name: true)
      
      ticket1 = create(:ticket, resource_category_id: cat_id)
      ticket2 = create(:ticket, resource_category_id: cat_id)
      ticket3 = create(:ticket, resource_category_id: new_category.id)
      
      expect(Ticket.resource_category(cat_id).count).to eq(2)
      
      new_category = create(:resource_category, unique_name: true)
      ticket1.resource_category_id = new_category.id
      ticket1.save!
      
      expect(Ticket.resource_category(cat_id).count).to eq(1)
    end

  end
end
