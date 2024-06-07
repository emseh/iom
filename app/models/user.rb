# frozen_string_literal: true

class User < ApplicationRecord
  rolify before_add: :remove_existing_role

  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable # :omniauthable

  has_one :user_information, dependent: :destroy

  accepts_nested_attributes_for :user_information

  before_save :assign_default_role
  after_create :must_have_a_role

  private

  def remove_existing_role(_role)
    roles.destroy_all
  end

  def assign_default_role
    add_role(:leader) if roles.blank?
  rescue ActiveRecord::RecordInvalid => e
    errors.add(:roles, e.message)
    throw(:abort)
  end

  def must_have_a_role
    return if roles.any?

    errors.add(:roles, 'must have at least one')
    throw(:abort)
  end
end
