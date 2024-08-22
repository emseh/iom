# frozen_string_literal: true

class CreatePayoutChannels < ActiveRecord::Migration[7.1]
  def change
    create_table :payout_channels do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.string :payout_type, null: false
      t.boolean :active, null: false, default: false

      t.timestamps
    end
  end
end
