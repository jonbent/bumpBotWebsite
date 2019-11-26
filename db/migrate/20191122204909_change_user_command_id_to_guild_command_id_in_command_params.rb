class ChangeUserCommandIdToGuildCommandIdInCommandParams < ActiveRecord::Migration[5.2]
  def change
    rename_column :command_params, :user_command_id, :guild_command_id
  end
end
