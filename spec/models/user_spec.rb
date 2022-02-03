require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { build(:user) } 

  it "factory" do
    expect(user).to be_valid
    expect(build(:user, email:nil).email).to eq(nil)
    expect(build(:user, password:nil).password).to eq(nil)
    # expect(build(:user, :no_email)).to be_invalid
  end

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
      it { user.should validate_uniqueness_of(:email).case_insensitive }
    end

    describe "validates length of password" do
      it { user.should validate_length_of(:password) }
    end

  end

  describe "associations" do

    describe "may belong to organization" do
      it { user.should belong_to(:organization) } 
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

    it "returns the user's email" do
      expect(user.to_s).to eq(user.email)
    end
  
  end

end
