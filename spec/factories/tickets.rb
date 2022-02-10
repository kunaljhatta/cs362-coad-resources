FactoryBot.define do

  factory :ticket do
    name { "fake name" }
    description { "description" }
    phone { "+13337777777" }
    closed { false }    
    region 
    resource_category 
    organization_id { 1 } # reduce a database hit by not creating
  end

end
