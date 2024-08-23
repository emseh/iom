class AddBankAccountToMemos < ActiveRecord::Migration[7.1]
  def change
    add_reference :memos, :bank_account, null: false, foreign_key: true
  end
end
