FactoryBot.define do
  factory :region do
    transient do
      unique_name { false }
    end
    sequence(:name) { |n| "Fake Region#{" #{n}" if unique_name}" }
  end

end
