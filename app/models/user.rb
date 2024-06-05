# frozen_string_literal: true

class User < ApplicationRecord
  rolify before_add: :remove_existing_role

  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable # :omniauthable

  validate :must_have_a_role

  after_create :assign_default_role

  private

  def remove_existing_role(_role)
    roles.destroy_all
  end

  def assign_default_role
    add_role(:leader) if roles.blank?
  end

  def must_have_a_role
    errors.add(:roles, 'must have at least one') unless roles.any?
  end
end
