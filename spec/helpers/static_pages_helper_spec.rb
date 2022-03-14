require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the StaticPagesHelper. For example:
#
describe StaticPagesHelper do
  describe "string concatination" do
    it "concats two strings with spaces" do
      string = ("this "+"that")
      expect(string).to eq("this that")
    end
  end
end
RSpec.describe StaticPagesHelper, type: :helper do
  # pending "add some examples to (or delete) #{__FILE__}"
end
