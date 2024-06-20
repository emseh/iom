# frozen_string_literal: true

class Leader < User
  default_scope { with_role(:leader) }

  accepts_nested_attributes_for :user_patner, allow_destroy: true

  before_save :assign_default_role

  def assign_default_role
    add_role(:leader) if roles.blank?
  rescue ActiveRecord::RecordInvalid => e
    errors.add(:roles, e.message)
    throw(:abort)
  end
end
