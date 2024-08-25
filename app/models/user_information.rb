# frozen_string_literal: true

class UserInformation < ApplicationRecord
  belongs_to :user

  validates :full_name, presence: true
  validates :phone_number, phone: true, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at full_name id id_value phone_number updated_at user_id]
  end
end
