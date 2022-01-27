require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
  describe "instantiation" do
    it "exists" do
      ResourceCategory
    end
  end

  describe "associations" do
    resource_category = ResourceCategory.new
    specify { resource_category.should have_and_belong_to_many(:organizations) }
  end

  describe "validations" do
    resource_category = ResourceCategory.new
    it { resource_category.should validate_presence_of(:name) }
    it { resource_category.should validate_length_of(:name) }
    it { resource_category.should validate_uniqueness_of(:name).case_insensitive }
  end


  describe "method" do
    it "returns its name when to_s is called" do
      fake_name = "Fake Category"
      resource_category = ResourceCategory.new(name:fake_name)
      expect(resource_category.to_s).to eq(fake_name)
    end
  end
end
