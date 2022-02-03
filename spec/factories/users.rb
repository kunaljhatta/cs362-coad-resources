FactoryBot.define do
    factory :user do
        email { "factory_user@fake.fake" }
        password { "factory_password" }

        factory :no_email do
            email { nil }
        end

        factory :no_password do
            password { nil }
        end
    end
end