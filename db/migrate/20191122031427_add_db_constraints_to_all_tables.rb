class AddDbConstraintsToAllTables < ActiveRecord::Migration[5.2]
  def change
    change_column :guilds, :guild_id, :string, :null => false
    change_column :guilds, :user_id, :bigint, :null => false, foreign_key: true
    change_column :user_commands, :user_id, :bigint, :null => false, foreign_key: true
    change_column :user_commands, :class, :string, :null => false
    change_column :user_commands, :method, :string, :null => false
    change_column :user_commands, :prefix, :string, :null => false
    change_column :users, :_id, :bigint, :null => false
    change_column :users, :email, :string, :null => false
  end
end
