# frozen_string_literal: true

class CreateDeclares < ActiveRecord::Migration[7.1]
  def change
    create_table :declares do |t|
      t.references :user, null: false, foreign_key: true
      t.references :declare_category, null: false, foreign_key: true
      t.integer :status, null: false, default: 0
      t.decimal :amount, precision: 16, scale: 2, default: 0.0, null: false
      t.string :declare_proof

      t.timestamps
    end
  end
end
