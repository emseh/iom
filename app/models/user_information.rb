class UserInformation < ApplicationRecord
  belongs_to :user

  validates :full_name, presence: true
  validates :phone_number, phone: true, presence: true
end
