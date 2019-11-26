class AddDefaultCommandIdToGuildCommands < ActiveRecord::Migration[5.2]
  def change
    add_column :guild_commands, :default_command_id, :bigint, foreign_key: true
    remove_column :guild_commands, :command_class
    remove_column :guild_commands, :method
    add_index :guild_commands, :default_command_id
  end
end
