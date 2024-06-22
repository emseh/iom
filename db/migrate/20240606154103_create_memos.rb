# frozen_string_literal: true

class CreateMemos < ActiveRecord::Migration[7.1]
  def change
    create_table :memos do |t|
      t.references :user, null: false, foreign_key: true
      t.references :memo_category, null: false, foreign_key: true
      t.integer :status, default: 0
      t.text :description

      t.timestamps
    end
  end
end
