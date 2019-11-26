class AddCommandToGuildCommands < ActiveRecord::Migration[5.2]
  def change
    add_column :guild_commands, :command, :string
    add_index :guild_commands, :command
    add_index :guild_commands, [:command, :guild_id], unique: true
  end
end
