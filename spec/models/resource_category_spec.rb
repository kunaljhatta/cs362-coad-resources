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


  describe "method" do # bad test
    it "to_s returns its name when called" do
      fake_name = "Fake Category"
      resource_category = ResourceCategory.new(name:fake_name)
      expect(resource_category.to_s).to eq(fake_name)
    end

    it "has :active scope when active is true" do
      resource_category = ResourceCategory.new
      resource_category.deactivate
      expect(resource_category.active).not_to be_truthy
      resource_category.activate
      expect(resource_category.active).to be_truthy
    end

    it "sets active value to true when instantiated" do
      resource_category = ResourceCategory.new
      expect(resource_category.active?).to be_truthy
      expect(resource_category.inactive?).not_to be_truthy
    end

    it "sets active to false when deactivate is called" do
      resource_category = ResourceCategory.new
      resource_category.deactivate
      expect(resource_category.inactive?).to be_truthy
      expect(resource_category.active?).not_to be_truthy
    end
  end
end
