FactoryBot.define do
  factory :user do
    email { "factory_user@fake.fake" }
    password { "factory_password" }
  end
  
  trait :organization_user do
    role {"organization"}
    organization
  end
end
