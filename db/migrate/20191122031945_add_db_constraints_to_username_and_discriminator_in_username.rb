class AddDbConstraintsToUsernameAndDiscriminatorInUsername < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :username, :string, null: false
    change_column :users, :discriminator, :string, limit: 4, null: false
    add_index :users, [:username, :discriminator], unique: true
  end
end
