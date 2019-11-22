class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.boolean :verified
      t.string :locale
      t.bigint :premium_type
      t.boolean :mfa_enabled
      t.bigint :_id
      t.bigint :flags
      t.string :avatar
      t.integer :discriminator, limit: 4
      t.string :email

      t.timestamps
    end
  end
end
