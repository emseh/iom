# frozen_string_literal: true

FactoryBot.define do
  factory :leader do
    email { Faker::Internet.email(name: Faker::Name.unique.name_with_middle, separators: ['.'], domain: 'leader.com') }
    password { 'password' }
    password_confirmation { 'password' }
    before(:create) do |leader|
      build(:user_information, user: leader, full_name: leader.email.split('@').first.split('.').map(&:capitalize).join(' '))
      build(:user_patner, patner: Patner.all.sample, user: leader)
    end

    after(:create) do |leader|
      create(:bank_account, user: leader, name: leader.email.split('@').first.split('.').map(&:capitalize).join(' '),
                            payout_channel_id: PayoutChannel.where(active: true).ids.sample, number: Faker::Bank.account_number(digits: 10))
    end
  end
end
