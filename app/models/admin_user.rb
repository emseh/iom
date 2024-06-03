# frozen_string_literal: true

class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable # , :omniauthable

  def self.ransackable_attributes(_auth_object = nil)
    %w[id email created_at updated_at sign_in_count]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[]
  end
end
