class RemoveDescriptionFromGuildDescription < ActiveRecord::Migration[5.2]
  def change
    remove_column :guild_commands, :description, :text
  end
end
