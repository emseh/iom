# frozen_string_literal: true

FactoryBot.define do
  factory :memo do
    user_id { Leader.ids.sample }
    memo_category_id { MemoCategory.ids.sample }
    status { 0 }
    description { Faker::Lorem.paragraph_by_chars }
    amount { Faker::Commerce.price(range: 10_000..10_000_000, as_string: true) }
    memo_proof do
      Rack::Test::UploadedFile.new(
        Rails.root.join('spec/data/fake-invoice.png'), 'image/jpeg'
      )
    end
  end
end
