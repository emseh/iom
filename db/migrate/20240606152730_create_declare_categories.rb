# frozen_string_literal: true

class CreateDeclareCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :declare_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
