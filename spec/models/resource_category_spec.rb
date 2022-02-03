require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
  describe "attributes" do
    it "resource category is valid when name is not blank" do
      resource_category = ResourceCategory.new(name:"Fake Name")
      expect(resource_category).to be_valid
    end

    it "resource category is not valid with blank name" do
      resource_category = ResourceCategory.new
      expect(resource_category).not_to be_valid
    end

    it "name is unique" do
      category_name = "Fake Category"
      resource_category = ResourceCategory.create(name: category_name)
      resource_dup_name = ResourceCategory.new(name: category_name)
      expect(resource_dup_name).to be_invalid
    end  
  end


  describe "instantiation" do
    it "exists" do
      ResourceCategory
    end
  end

  describe "associations" do
    it "has and belongs to many :organizations" do
      resource_category = ResourceCategory.new
      expect { resource_category.should have_and_belong_to_many(:organizations) }
    end

    it "has many tickets" do
      resource_category = ResourceCategory.new
      expect { resource_category.should have_many(:tickets) }
    end

  end

  describe "validations" do
    resource_category = ResourceCategory.new
    it { resource_category.should validate_presence_of(:name) }
    it { resource_category.should validate_length_of(:name) }
    it { resource_category.should validate_uniqueness_of(:name).case_insensitive }
  end


  describe "method" do
    it "using unspecified will return category with name 'Unspecified'" do
      resource_category = ResourceCategory.unspecified
      expect(resource_category.name).to eq("Unspecified")
    end

    it "using activate method will set active to true" do
      resource_category = ResourceCategory.new(active:false)
      resource_category.activate
      expect(resource_category.active).to be_truthy
    end

    it "using deactivate will set active to false" do
      resource_category = ResourceCategory.new
      resource_category.deactivate
      expect(resource_category.active).to be_falsy
    end

    it "inactive? returns true when active is false" do
      resource_category = ResourceCategory.new
      expect(resource_category.inactive?).not_to be_truthy
    end

    it "inactive? returns false when active is true" do
      resource_category = ResourceCategory.new(active:true)
      expect(resource_category.inactive?).to be_falsy
    end

    it "active? returns true when category is active" do
      resource_category = ResourceCategory.new(active:true)
      expect(resource_category.active?).to be_truthy
    end

    it "active? returns false when category is inactive" do
      resource_category = ResourceCategory.new(active:false)
      expect(resource_category.active?).to be_falsy
    end

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
