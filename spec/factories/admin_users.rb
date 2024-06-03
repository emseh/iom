# frozen_string_literal: true

FactoryBot.define do
  factory :admin_user do
    email { Faker::Internet.email(name: Faker::Name.name, separators: ['.'], domain: 'test.com') }
    password { 'password' }
  end
end
