class CreateUserInformations < ActiveRecord::Migration[7.1]
  def change
    create_table :user_informations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :full_name
      t.string :phone_number

      t.timestamps
    end
  end
end
