# frozen_string_literal: true

class CreateMemoCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :memo_categories do |t|
      t.string :name

      t.timestamps
    end
    add_index :memo_categories, :name, unique: true
  end
end
