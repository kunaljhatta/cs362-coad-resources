require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

  describe "methods" do
    
    base_title = 'Disaster Resource Network'
    page_title = 'Fake Page'
    param_title = "#{page_title} | #{base_title}"

    it "full_title prints out the base title with no parameters" do
      expect(full_title).to eq(base_title)
    end

    it "full_title concatenates parameter to the front of returned string" do
      expect(full_title(page_title)).to eq(param_title)
    end
  end
end
