require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
  let(:build_cat) { FactoryBot.build(:resource_category) }
  let(:stubbed_cat) {FactoryBot.build_stubbed(:resource_category) }
  let(:create_cat) { create(:resource_category) }
  let(:unspecified) { ResourceCategory.unspecified }
  let(:inactive) { FactoryBot.build(:inactive)}

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
  end

  describe "associations" do
    it "has and belongs to many :organizations" do
      
      expect { build_cat.should have_and_belong_to_many(:organizations) }
    end

    it "has many tickets" do
      expect { build_cat.should have_many(:tickets) }
    end

  end

  describe "validations" do
    it { build_cat.should validate_presence_of(:name) }
    it { build_cat.should validate_length_of(:name) }
    it { build_cat.should validate_uniqueness_of(:name).case_insensitive }
  end


  describe "method" do
    it "using unspecified will return category with name 'Unspecified'" do
      expect(unspecified.name).to eq("Unspecified")
    end

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

    # it ":active scope returns all active Resource categories", skip:true do
    #   pending
    # end

    # it ":inactive scope returns all inactive categories", skip:true do
    #   pending
    # end

  end
end
