FactoryBot.define do 
  factory :resource_category do

    transient do
      unique_name { false }
    end

    sequence(:name) { |n| "Fake Category#{" #{n}" if unique_name}" }

    factory :inactive do
      active { false }
    end
    
  end
end
