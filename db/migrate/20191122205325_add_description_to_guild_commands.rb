class AddDescriptionToGuildCommands < ActiveRecord::Migration[5.2]
  def change
    add_column :guild_commands, :description, :text
  end
end
