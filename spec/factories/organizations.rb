
FactoryBot.define do 
    factory :organization do 
        name {"Fake Organization"}
        status { "submitted"}
        phone {"5412205454"}
        # email {"fake@fake.com"}
        description {"This is a fake organization"}
        rejection_reason {"Fake Rejection"}
        created_at {DateTime.new(2001,2,3,4,5,6)}
        updated_at {DateTime.new(2001,2,3,4,5,6)}
        liability_insurance {false}
        primary_name {"FakeName"}
        secondary_name {"FakeSecondName"}
        secondary_phone {"5419002285"}
        title {"FakeTitle"}
        transportation {"no"}

        transient do
            unique_email { true }
        end

        sequence(:email) { |n| "fake#{"#{n}" if unique_email}@fake.com" }

        trait :set_submitted do 
            status {:submitted}
        end
            
        trait :set_rejected do
            status {:rejected}
        end    
    end
end