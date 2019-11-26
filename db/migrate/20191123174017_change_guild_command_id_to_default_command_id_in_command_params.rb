class ChangeGuildCommandIdToDefaultCommandIdInCommandParams < ActiveRecord::Migration[5.2]
  def change
    rename_column :command_params, :guild_command_id, :default_command_id
  end
end
