# frozen_string_literal: true

class CreatePatners < ActiveRecord::Migration[7.1]
  def change
    create_table :patners do |t|
      t.string :name

      t.timestamps
    end
  end
end
