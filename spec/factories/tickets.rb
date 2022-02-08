FactoryBot.define do

    factory :ticket do
    name { "fake name" }
    phone { "1231234567" }
    region_id { create(:region) }
    resource_category_id { create(:resource_category) }
    description { "description" }
  end

end
