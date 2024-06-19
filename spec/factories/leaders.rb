# frozen_string_literal: true

FactoryBot.define do
  factory :leader do
    email { Faker::Internet.email(name: Faker::Name.unique.name_with_middle, separators: ['.'], domain: 'leader.com') }
    password { 'password' }
    password_confirmation { 'password' }
    before(:create) do |leader|
      create(:user_information, user: leader, full_name: leader.email.split('@').first.split('.').map(&:capitalize).join(' '))
    end
  end
end
