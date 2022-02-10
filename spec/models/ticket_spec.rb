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
      it { ticket.should validate_length_of(:name) }
    end

    describe "validates length of description" do
      it { ticket.should validate_length_of(:description) }
    end 

    describe "validates plausibility of phone" 

  end

  describe "associations" do
    
    describe "belongs to region"
    describe "belongs to resource_category"
    describe "may belong to organization"

  end

end
