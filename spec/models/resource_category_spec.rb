require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
  
  let(:build_cat) { build(:resource_category) }
  let(:stubbed_cat) { build_stubbed(:resource_category) }
  let(:stubbed_inactive) { build_stubbed(:inactive) }
  let(:create_cat) { create(:resource_category) }
  let(:inactive) { build(:inactive)}

  describe "attributes" do
    it "resource category is valid when name is not blank" do
      expect(build_cat).to be_valid
    end

    it "resource category is not valid with blank name" do
      build_cat.name = nil
      expect(build_cat).not_to be_valid
    end

    it "category requires name is unique" do
      category_name = create_cat.name
      expect(build_cat).to be_invalid
    end
    
    it "has a name" do
      expect(build_cat).to respond_to(:name)
    end
  end

  describe "associations" do
    it "has and belongs to many :organizations" do
      
      expect { expect(build_cat).to have_and_belong_to_many(:organizations) }
    end

    it "has many tickets" do
      expect { expect(build_cat).to have_many(:tickets) }
    end

  end

  describe "validations" do
    it { expect(build_cat).to validate_presence_of(:name) }
    it { expect(build_cat).to validate_length_of(:name) }
    it { expect(build_cat).to validate_uniqueness_of(:name).case_insensitive }
  end

  describe "method" do

    it "using activate method will set active to true" do
      inactive.activate
      expect(inactive.active).to be_truthy
    end

    it "using deactivate will set active to false" do
      build_cat.deactivate
      expect(build_cat.active).to be_falsy
    end

    it "inactive? returns true when active is false" do
      expect(build_cat.inactive?).not_to be_truthy
    end

    it "inactive? returns false when active is true" do
      build_cat.active = true
      expect(build_cat.inactive?).to be_falsy
      build_cat.active = false
      expect(build_cat.inactive?).to be_truthy
    end

    it "active? returns true when category is active" do
      inactive.activate
      expect(inactive.active?).to be_truthy
    end

    it "active? returns false when category is inactive" do
      expect(inactive.active?).to be_falsy
    end

    it "to_s returns its name when called" do
      fake_name = build_cat.name
      expect(build_cat.to_s).to eq(fake_name)
    end
  end

  describe "static methods" do
    it "using unspecified will return category with name 'Unspecified'" do
      expect(ResourceCategory.unspecified.name).to eq("Unspecified")
    end
  end

  describe "scope" do
    
    it ":active scope returns all active Resource categories" do
      cat1 = create(:resource_category, unique_name: true)
      cat2 = create(:resource_category, unique_name: true)
      cat3 = create(:resource_category, unique_name: true)

      expect(ResourceCategory.active.count).to eq(3)

      cat3.deactivate

      expect(ResourceCategory.active.count).to eq(2)
      
    end

    it ":inactive scope returns all inactive categories" do
      cat1 = create(:resource_category, unique_name: true)
      cat2 = create(:resource_category, unique_name: true)
      cat3 = create(:resource_category, unique_name: true)

      expect(ResourceCategory.inactive.count).to eq(0)

      cat3.deactivate
      cat2.deactivate
      
      expect(ResourceCategory.inactive.count).to eq(2)
    end
  end
end
