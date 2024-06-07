# db/seeds.rb

require 'faker'

if Rails.env.development?
  Admin.find_or_create_by!(email: 'admin@example.com') do |admin|
    admin.password = 'password'
    admin.password_confirmation = 'password'
  end

  Leader.find_or_create_by!(email: 'leader@example.com') do |leader|
    leader.password = 'password'
    leader.password_confirmation = 'password'
  end

  User.find_each(&:confirm)

  PATNERS = [
    { name: 'PT Media Nusantara Citra Tbk', code: 'MNC' },
    { name: 'PT Link Net Tbk', code: 'FIRST MEDIA' },
    { name: 'PT Perusahaan Listrik Negara', code: 'ICONNET' }
  ].freeze

  PATNERS.each do |patner|
    Patner.find_or_create_by!(name: patner[:name], code: patner[:code])
  end
end
