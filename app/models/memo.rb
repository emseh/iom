# frozen_string_literal: true

class Memo < ApplicationRecord
  belongs_to :user
  belongs_to :memo_category

  enum status: { submitted: 0, approved: 1, paid: 2, finished: 3 }
end
