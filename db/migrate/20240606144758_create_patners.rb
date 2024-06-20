# frozen_string_literal: true

class CreatePatners < ActiveRecord::Migration[7.1]
  def change
    create_table :patners do |t|
      t.string :name, null: false
      t.string :code, null: false

      t.timestamps
    end
    add_index :patners, :name, unique: true
    add_index :patners, :code, unique: true
  end
end
