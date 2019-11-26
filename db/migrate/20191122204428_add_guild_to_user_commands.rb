class AddGuildToUserCommands < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_commands, :guild, foreign_key: true
  end
end
