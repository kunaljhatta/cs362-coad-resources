require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { build(:user) } 

  describe "attributes" do

    it "is valid with valid attributes" do
      expect(user).to be_valid
    end

    it "is not valid without an email" do
      expect(build(:user, email:nil)).to be_invalid
    end

    it "is not valid without a password" do
      expect(build(:user, password:nil)).to be_invalid
    end

  end

  describe "validations" do

    describe "validates length of email" do
      it { expect(user).to validate_length_of(:email) }
    end

    it "validates email format" do
      expect(build(:user, email:"noSymbols")).to be_invalid
      expect(build(:user, email:"noAtSymbol.com")).to be_invalid
      expect(build(:user, email:"twoAts@@.com")).to be_invalid
      expect(build(:user, email:"noDot@fake")).to be_invalid
      expect(build(:user, email:"wrongOrder.@com")).to be_invalid
      expect(build(:user, email:"icon'@fake.fake")).to be_invalid
      expect(build(:user, email:"icon!@fake.fake")).to be_invalid
      expect(build(:user, email:'icon"@fake.fake')).to be_invalid
    end

    describe "validates uniqueness of email" do
      it { expect(user).to validate_uniqueness_of(:email).case_insensitive }
    end

    describe "validates length of password" do
      it { expect(user).to validate_length_of(:password) }
    end

  end

  describe "associations" do

    describe "may belong to organization" do
      it { expect(user).to belong_to(:organization) } 
    end

  end

  describe "methods" do
    
    it "sets role to default role if a role is not already set" do
      user.set_default_role
      expect(user.role).to eq("organization")
      user.role = nil
      user.set_default_role
      expect(user.role).to eq("organization")
    end

    it "to_s returns the user's email" do
      expect(user.to_s).to eq(user.email)
    end
  
  end

end
