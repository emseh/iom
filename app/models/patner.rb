# frozen_string_literal: true

class Patner < ApplicationRecord
  has_many :user_patners, dependent: :destroy
  has_many :users, through: :user_patners

  def self.ransackable_attributes(_auth_object = nil)
    %w[code created_at id id_value name updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[user_patners users]
  end

  def name_code
    "#{name} - (#{code})"
  end
end
