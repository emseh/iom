# rubocop:disable Rails/HasAndBelongsToMany
# frozen_string_literal: true

class Role < ApplicationRecord
  TYPE = %w[admin leader].freeze

  has_and_belongs_to_many :users, join_table: :users_roles

  belongs_to :resource,
             polymorphic: true,
             optional: true

  validates :resource_type,
            inclusion: { in: Rolify.resource_types },
            allow_nil: true

  validates :name, inclusion: { in: TYPE.zip(TYPE).to_h }

  scopify
end

# rubocop:enable Rails/HasAndBelongsToMany
