class RemoveUserFromUserCommand < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_commands, :user_id
  end
end
