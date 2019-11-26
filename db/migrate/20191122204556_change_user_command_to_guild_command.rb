class ChangeUserCommandToGuildCommand < ActiveRecord::Migration[5.2]
  def change
    rename_table :user_commands, :guild_commands
  end
end
