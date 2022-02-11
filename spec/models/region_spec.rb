require 'rails_helper'

RSpec.describe Region, type: :model do

  let(:region){build(:region)} 

  describe "attributes" do 
    it "has a name" do 
      region = Region.new
      expect(region).to respond_to(:name)
    end
  end

  describe "validations" do
    it "validates presence of name" do
      should validate_presence_of(:name)
    end

    it "validates length of name" do
      should validate_length_of(:name).
        is_at_least(1).is_at_most(255)
    end

    it "validates uniqueness of name" do
      should validate_uniqueness_of(:name).case_insensitive
    end
  end

  describe "association" do
    it "Has many tickets" do
      should have_many :tickets
    end
  end

  describe "#to_s" do
    it "returns the name" do
      name = 'Mt. Hood'
      region = Region.new(name: name)
      expect(region.to_s).to eq(name)
    end
  end

end
