# frozen_string_literal: true

class DeclareCategory < ApplicationRecord
  has_many :declares, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
