# frozen_string_literal: true

class Patner < ApplicationRecord
  has_many :user_patners, dependent: :destroy
  has_many :users, through: :user_patners

  def name_code
    "#{name} - (#{code})"
  end
end
