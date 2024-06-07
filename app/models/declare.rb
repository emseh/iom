# frozen_string_literal: true

class Declare < ApplicationRecord
  belongs_to :user
  belongs_to :declare_category
end
