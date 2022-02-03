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

    describe "validates length of email" do
      user = User.new(email:"fake@fake.com", password:"fake1234")
      it { user.should validate_length_of(:email) }
    end

    it "validates email format" do
      expect(User.new(email:"noSymbols", password:"fake1234")).to be_invalid
      expect(User.new(email:"noAtSymbol.com", password:"fake1234")).to be_invalid
      expect(User.new(email:"twoAts@@.com", password:"fake1234")).to be_invalid
      expect(User.new(email:"noDot@fake", password:"fake1234")).to be_invalid
      expect(User.new(email:"wrongOrder.@com", password:"fake1234")).to be_invalid
      expect(User.new(email:"icon'@fake.fake", password:"fake1234")).to be_invalid
      expect(User.new(email:"icon!@fake.fake", password:"fake1234")).to be_invalid
      expect(User.new(email:'icon"@fake.fake', password:"fake1234")).to be_invalid
    end

    describe "validates uniqueness of email" do
      user = User.new(email:"fake@fake.com", password:"fake1234")
      it { user.should validate_uniqueness_of(:email).case_insensitive }
    end

    describe "validates length of password" do
      user = User.new(email:"fake@fake.com", password:"fake1234")
      it { user.should validate_length_of(:password) }
    end

  end

  describe "associations" do

    describe "may belong to organization" do
      user = User.new(email:"fake@fake.com", password:"fake1234")
      it { user.should belong_to(:organization) } 
    end

    it "is optional to belong to organization" do
      user = User.new(email:"fake@fake.com", password:"fake1234")
      user.role = nil
      expect(user.role).to eq(nil) 
      expect(user).to be_valid
    end

  end

  describe "methods" do
    
    it "sets role to default role if a role is not already set" do
      user = User.new(email:"fake@fake.com", password:"fake1234")
      user.role = nil
      expect(user.role).to eq(nil)
      user.set_default_role
      expect(user.role).to eq("organization")
    end

    it "returns the user's email" do
      user = User.new(email:"fake@fake.com", password:"fake1234")
      expect(user.to_s).to eq(user.email)
    end
  
  end

end
