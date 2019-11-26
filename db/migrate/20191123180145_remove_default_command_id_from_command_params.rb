class RemoveDefaultCommandIdFromCommandParams < ActiveRecord::Migration[5.2]
  def change
    remove_column :command_params, :default_command_id, :string
  end
end
