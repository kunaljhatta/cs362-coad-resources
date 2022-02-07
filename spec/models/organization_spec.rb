RSpec.describe Organization, type: :model do

    let(:organization) { Organization.new(
     name: "FakeName",
     status: 1,
     phone: "0000000000",
     email: "fake@fake.com",
     description: "This is a fake organization",
     rejection_reason: "Fake Rejection",
     created_at: DateTime.new(2001,2,3,4,5,6),
     updated_at: DateTime.new(2001,2,3,4,5,6),
     liability_insurance: false,
     primary_name: "1111111111",
     secondary_name: "FakeSecondName",
     secondary_phone: "2222222222",
     title: "FakeTitle",
     transportation: 1
    ) }
   
     describe "attributes" do
       it "has a name" do
         expect(organization).to respond_to(:name)
       end
   
       it "has a status" do
         expect(organization).to respond_to(:status)
       end
   
       it "has a phone" do
         expect(organization).to respond_to(:phone)
       end
   
       it "has a email" do
         expect(organization).to respond_to(:email)
       end
   
       it "has a description" do
         expect(organization).to respond_to(:description)
       end
   
       it "has a rejection_reason" do
         expect(organization).to respond_to(:rejection_reason)
       end
   
       it "has a created_at" do
         expect(organization).to respond_to(:created_at)
       end
   
       it "has a updated_at" do
         expect(organization).to respond_to(:updated_at)
       end
   
       it "has a liability_insurance" do
         expect(organization).to respond_to(:liability_insurance)
       end
   
       it "has a primary_name" do
         expect(organization).to respond_to(:primary_name)
       end
   
       it "has a secondary_name" do
         expect(organization).to respond_to(:secondary_name)
       end
   
       it "has a secondary_phone" do
         expect(organization).to respond_to(:secondary_phone)
       end
   
       it "has a title" do
         expect(organization).to respond_to(:title)
       end
   
       it "has a transportation" do
         expect(organization).to respond_to(:transportation)
       end
     end
     describe "validators" do
        it "validates presence of email" do
          should validate_presence_of(:email)
        end
    
        it "validates presence of name" do
          should validate_presence_of(:name)
        end
    
        it "validates presence of phone" do
          should validate_presence_of(:phone)
        end
    
        it "validates presence of status" do
          should validate_presence_of(:status)
        end
    
        it "validates presence of primary_name" do
          should validate_presence_of(:primary_name)
        end
    
        it "validates presence of secondary_name" do
          should validate_presence_of(:secondary_name)
        end
    
        it "validates presence of secondary_phone" do
          should validate_presence_of(:secondary_phone)
        end
    
        it "validates length of email" do
          should validate_length_of(:email).
          is_at_least(1).is_at_most(255)
        end
    
        it "validates length of name" do
          should validate_length_of(:name).
          is_at_least(1).is_at_most(255)
        end
    
        it "validates length of description" do
          should validate_length_of(:description).
          is_at_most(1020)
        end
    
      end
     
   end