class AddEnabledToUserCommand < ActiveRecord::Migration[5.2]
  def change
    add_column :user_commands, :enabled, :boolean, default: true
  end
end
