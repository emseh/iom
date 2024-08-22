# frozen_string_literal: true

class UserPatner < ApplicationRecord
  belongs_to :user
  belongs_to :patner
end
