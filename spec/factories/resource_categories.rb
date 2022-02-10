FactoryBot.define do
  
  factory :resource_category do
    
    name { "Fake Category" }
    
    factory :inactive do
      active { false }
    end
    
  end

end