# frozen_string_literal: true

class Admin < User
  default_scope { with_role(:admin) }

  before_save :assign_default_role

  def assign_default_role
    add_role(:admin) if roles.blank?
  rescue ActiveRecord::RecordInvalid => e
    errors.add(:roles, e.message)
    throw(:abort)
  end
end
