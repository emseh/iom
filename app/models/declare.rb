# frozen_string_literal: true

class Declare < ApplicationRecord
  belongs_to :user
  belongs_to :declare_category

  enum status: { submitted: 0, approved: 1, paid: 2, finished: 3 }
end
