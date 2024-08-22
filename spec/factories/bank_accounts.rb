# frozen_string_literal: true

FactoryBot.define do
  factory :bank_account do
    user { nil }
    payout_channel { nil }
    name { 'MyString' }
    number { 'MyString' }
    active { false }
  end
end
