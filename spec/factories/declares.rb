# frozen_string_literal: true

FactoryBot.define do
  factory :declare do
    user { nil }
    declare_category { nil }
    status { 1 }
    description { 'MyText' }
  end
end
