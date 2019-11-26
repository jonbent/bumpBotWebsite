class AddPresenceToUserCommandIdAndAddUniqueIndexConstraintInCommandParams < ActiveRecord::Migration[5.2]
  def change
    change_column :command_params, :user_command_id, :bigint, null: false
    add_index :command_params, [:param_key, :param_value, :user_command_id], unique: true, name: :unique_values_in_command_params
  end
end
