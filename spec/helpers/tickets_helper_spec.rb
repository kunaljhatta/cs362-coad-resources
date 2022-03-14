require 'rails_helper'

RSpec.describe TicketsHelper, type: :helper do

  describe "methods" do
    ph_number = "5415551212"
    ph_number2 = "+1(541)555-1212"
    ph_number3 = "541-555-1212"
    ph_number4 = "(541-555-1212)"
    it "changes poorly formatted numbers into the US format" do
      expect(format_phone_number(ph_number)).to eq("+15415551212")
      expect(format_phone_number(ph_number2)).to eq("+15415551212")
      expect(format_phone_number(ph_number3)).to eq("+15415551212")
      expect(format_phone_number(ph_number4)).to eq("+15415551212")
    end
  end
end
