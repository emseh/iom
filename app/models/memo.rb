# frozen_string_literal: true

class Memo < ApplicationRecord
  belongs_to :user
  belongs_to :memo_category
end
