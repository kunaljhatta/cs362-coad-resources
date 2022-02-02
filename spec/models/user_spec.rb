require 'rails_helper'

RSpec.describe User, type: :model do

  describe "attributes" do
    
    fake_email = "fake@fake.com"
    fake_pass = "pass1234"

    it "is valid with valid attributes" do
      expect(User.new(email:fake_email, password:fake_pass)).to be_valid
    end

    it "is not valid without an email" do
      expect(User.new(password:fake_pass)).to be_invalid
    end

    it "is not valid without a password" do
      expect(User.new(email:fake_email)).to be_invalid
    end

  end

  describe "validations" do

    it "validates length of email" do
      # user = User.new()  # (email:"fake@fake.com", password:"fake1234")
      # it { user.should validate_length_of(:email) }
      too_short_email = ""
      too_long_email = "obijmonioinonoakfnaskldfnoawifskldmojirweklafsmdoilknawefsodinjkeawfoisnawerjngfvjknawoierfjaoijiooinfakjwefaofoaefnoinoninoinooohdiniiiioibjnmoijoijmonioinonoakfnaskldfnoawifskldmojirweklafsmdoilknjkeawfoisnawerjngfvjknawjdjdjksjoierfjaoijiooiono@fake.com"
      expect(User.new(email:too_short_email, password:"fake1234")).to be_invalid
      expect(User.new(email:too_long_email, password:"fake1234")).to be_invalid
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

    it "validates uniqueness of email" do
      same_email = "same@same.same"
      original = User.create!(email:same_email, password:"pass1222")
      expect(original).to be_valid
      dup = User.new(email:same_email, password:"pass1333")
      expect(dup).to be_invalid
    end

    it "validates length of password" do 
      expect(User.new(email:"fake@fake.com", password:"short")).to be_invalid
      expect(User.new(email:"fake@fake.com", password:"looooooooong11888111111122223454354575645685645doilknawefsodinjkeawfoisnawerjngfvjknawoierfjaoijiooinfakjwefaofoaefnoinoninoinooohdiniiiioibjnmoijoijmonioinonoakfnaskldfnoawifskldmojirweklafsmdoilknjkeawfoisnawerjngfvjknawjdjdjksjoierfjaoijiooiononoinoeoif")).to be_invalid
    end

  end

end
