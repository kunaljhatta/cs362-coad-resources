require 'rails_helper'

RSpec.describe Ticket, type: :model do

  let(:ticket) { create(:ticket) } 

  describe "attributes" do 

    it "is valid with valid attributes" do
      expect(ticket).to be_valid
    end
    
    it "is not valid without a name"
    it "is not valid without a phone number"
    it "is not valid without a region id"
    it "is not valid without a resource category id"
  
  end

end
