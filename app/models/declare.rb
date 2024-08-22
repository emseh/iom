# frozen_string_literal: true

class Declare < ApplicationRecord
  mount_uploader :declare_proof, ProofUploader

  has_rich_text :description

  belongs_to :user
  belongs_to :declare_category

  enum status: { submitted: 0, approved: 1, paid: 2, finished: 3 }

  validates :status, :description, presence: true
  validates :amount, numericality: { greater_than: 0 }
end
