# frozen_string_literal: true

FactoryBot.define do
  factory :admin do
    email { Faker::Internet.email(name: Faker::Name.unique.name_with_middle, separators: ['.'], domain: 'admin.com') }
    password { 'password' }
    password_confirmation { 'password' }
    # Create associated user_information when creating an admin
    after(:create) do |admin|
      create(:user_information, user: admin, full_name: admin.email.split('@').first.split('.').map(&:capitalize).join(' '))
    end
  end
end
