# frozen_string_literal: true

class CreateBankAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :bank_accounts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :payout_channel, null: false, foreign_key: true
      t.string :name, null: false
      t.string :number, null: false

      t.timestamps
    end
  end
end
