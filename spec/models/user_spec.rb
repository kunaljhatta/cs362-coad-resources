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
    it "validates minimum length of email" do
      expect(User.new(email:"", password:"fake1234")).to be_invalid
    end
    it "validates maximum length of email" do
      too_long_email = "obijmonioinonoakfnaskldfnoawifskldmojirweklafsmdoilknawefsodinjkeawfoisnawerjngfvjknawoierfjaoijiooinfakjwefaofoaefnoinoninoinooohdiniiiioibjnmoijoijmonioinonoakfnaskldfnoawifskldmojirweklafsmdoilknjkeawfoisnawerjngfvjknawjdjdjksjoierfjaoijiooiono@fake.com"
      expect(User.new(email:too_long_email, password:"fake1234")).to be_invalid
    end
    it "validates email format" do
      expect(User.new(email:"noAtSymbol", password:"fake1234")).to be_invalid
      expect(User.new(email:"noDot@fake", password:"fake1234")).to be_invalid
    end
    it "validates uniqueness of email"
    it "validates length of password"
  end

end
