class ChangeIndexOnGuildCommand < ActiveRecord::Migration[5.2]
  def change
    remove_index :guild_commands, [:command, :guild_id]
    add_index :guild_commands, [:default_command_id, :guild_id], unique: true
  end
end
