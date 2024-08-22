# frozen_string_literal: true

class CreateMemos < ActiveRecord::Migration[7.1]
  def change
    create_table :memos do |t|
      t.references :user, null: false, foreign_key: true
      t.references :memo_category, null: false, foreign_key: true
      t.integer :status, null: false, default: 0
      t.decimal :amount, precision: 16, scale: 2, default: 0.0, null: false
      t.string :memo_proof

      t.timestamps
    end
  end
end
