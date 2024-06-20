# db/seeds.rb

require 'faker'

if Rails.env.development?
  PATNERS = [
    { name: 'PT Media Nusantara Citra Tbk', code: 'MNC' },
    { name: 'PT Link Net Tbk', code: 'FM' },
    { name: 'PT Perusahaan Listrik Negara', code: 'ICONNET' }
  ].freeze

  PATNERS.each do |patner|
    Patner.find_or_create_by!(name: patner[:name], code: patner[:code])
  end

  MEMO_CATEGORIES = ['Pengadaan Alat Kerja', 'Pengadaan Bahan', 'Biaya Transportasi'].freeze

  MEMO_CATEGORIES.each do |memo_category|
    MemoCategory.find_or_create_by!(name: memo_category)
  end

  DECLARE_CATEGORIES = ['Biaya Rumah Sakit', 'Biaya Transportasi', 'Biaya Parkir'].freeze

  DECLARE_CATEGORIES.each do |declare_category|
    DeclareCategory.find_or_create_by!(name: declare_category)
  end

  Admin.find_or_create_by!(email: 'admin@example.com') do |admin|
    admin.password = 'password'
    admin.password_confirmation = 'password'
    admin.build_user_information(full_name: 'Admin Example', phone_number: "081#{Faker::Number.number(digits: 9)}")
  end

  Leader.find_or_create_by!(email: 'leader@example.com') do |leader|
    leader.password = 'password'
    leader.password_confirmation = 'password'
    leader.build_user_information(full_name: 'Leader Example', phone_number: "082#{Faker::Number.number(digits: 9)}")
    leader.build_user_patner(patner_id: Patner.ids.sample)
  end

  User.find_each(&:confirm)
end
