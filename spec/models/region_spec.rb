require 'rails_helper'

RSpec.describe Region, type: :model do
    let(:rg) { build(:region) }

    let(:region){ Region.new(name: 'Fake Region')}
        it 'exists' do
            Region
        end

    describe "attributes" do 
        it "has a 4name" do
            region = Region.new
            expect(region).to respond_to(:name)
        end
    end

    describe "#to_s" do
        it "returns the name" do
            name = 'Mt. Hood'
            region = Region.new(name: name)
            result = region.to_s
            expect(result).to eq(name) 
        end
    end

    describe "::unspecified" do
        it "returns a Region with the name 'Unspecified'" do
            region = Region.unspecified
            expect(region.name).to eq("Unspecified")
        end
    end

    describe "associations" do
        it "has many tickets" do 
            expect(Region.new).to have_many(:tickets)
        end 
    end
    
    describe "attributes" do
        it "validates presence of name" do
          expect(region).to validate_presence_of(:name)
        end

        it "name is not blank" do
            region = Region.new(name: nil)
            expect(region).to be_invalid
        end
    
        it "validates name length minimum" do
          expect(region).to validate_length_of(:name).is_at_least(1)
        end

        it "validates name length maximum" do
            expect(region).to validate_length_of(:name).is_at_most(255)
          end
        
        it "validates name uniqueness" do
          expect(region).to validate_uniqueness_of(:name).case_insensitive
        end

        it "expects name to be unique" do
            name = "Unique Region name"
            reqion = Region.create(name: name)
            duplicate_region = Region.new(name: name)
            expect(region).to be_valid
            expect(duplicate_region).to be_invalid
        end 
      end
      
end

