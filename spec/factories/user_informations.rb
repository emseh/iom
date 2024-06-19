# frozen_string_literal: true

FactoryBot.define do
  mobile_prefixes = %w[81 82 83 85 86 87 88 89]
  prefix = mobile_prefixes.sample
  phone_number = "0#{prefix}#{Faker::Number.number(digits: 9)}"
  factory :user_information do
    phone_number { phone_number }
  end
end
