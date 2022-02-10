FactoryBot.define do

  factory :ticket do
    name { "fake name" }
    description { "description" }
    phone { "+13337777777" }
    closed { false }    
    association :region, unique_name: true
    association :resource_category, unique_name: true
    organization_id { 1 } 
  end

end
