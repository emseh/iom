# frozen_string_literal: true

class CreateDeclares < ActiveRecord::Migration[7.1]
  def change
    create_table :declares do |t|
      t.references :user, null: false, foreign_key: true
      t.references :declare_category, null: false, foreign_key: true
      t.integer :status, default: 0
      t.text :description

      t.timestamps
    end
  end
end
