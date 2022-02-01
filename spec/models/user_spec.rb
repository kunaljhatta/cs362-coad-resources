require 'rails_helper'

RSpec.describe User, type: :model do

  describe "attributes" do
    fake_email = "fake@fake.com"
    fake_pass = "pass1234"
    it "is valid with valid attributes" do
      expect(User.new(email:fake_email, password:fake_pass)).to be_valid
    end
    it "is not valid without an email" do
      expect(User.new(password:fake_pass)).to be_invalid
    end
    it "is not valid without a password" do
      expect(User.new(email:fake_email)).to be_invalid
    end
  end

  describe "validations" do
    it "validates length of email"
    it "validates email format"
    it "validates uniqueness of email"
    it "validates length of password"
  end

end
