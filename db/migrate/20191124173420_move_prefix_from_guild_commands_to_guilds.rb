class MovePrefixFromGuildCommandsToGuilds < ActiveRecord::Migration[5.2]
  def change
    remove_column :guild_commands, :prefix, :string
    add_column :guilds, :prefix, :string, null: false, default: '!'
  end
end
