# frozen_string_literal: true

class UserPatner < ApplicationRecord
  belongs_to :user
  belongs_to :patner

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id id_value patner_id updated_at user_id]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[patner user]
  end
end
