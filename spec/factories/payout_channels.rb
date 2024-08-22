# frozen_string_literal: true

FactoryBot.define do
  factory :payout_channel do
    name { 'MyString' }
    code { 'MyString' }
    payout_type { 'MyString' }
    active { false }
  end
end
