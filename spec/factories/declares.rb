# frozen_string_literal: true

FactoryBot.define do
  factory :declare do
    user_id { Leader.ids.sample }
    declare_category_id { DeclareCategory.ids.sample }
    status { 0 }
    description { Faker::Lorem.paragraph_by_chars }
    amount { Faker::Commerce.price(range: 10_000..10_000_000, as_string: true) }
    declare_proof do
      Rack::Test::UploadedFile.new(
        Rails.root.join('spec/data/fake-invoice.png'), 'image/jpeg'
      )
    end
    bank_account_id { Leader.find(user_id).bank_accounts.ids.sample }
  end
end
