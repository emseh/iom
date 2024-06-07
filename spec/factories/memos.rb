# frozen_string_literal: true

FactoryBot.define do
  factory :memo do
    user { nil }
    memo_category { nil }
    status { 1 }
    description { 'MyText' }
  end
end
