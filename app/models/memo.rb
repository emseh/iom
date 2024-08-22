# frozen_string_literal: true

class Memo < ApplicationRecord
  mount_uploader :memo_proof, ProofUploader

  has_rich_text :description

  belongs_to :user
  belongs_to :memo_category

  enum status: { submitted: 0, approved: 1, paid: 2, finished: 3 }

  validates :status, :description, presence: true
  validates :amount, numericality: { greater_than: 0 }
end
