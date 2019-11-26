class ChangeGuildIdToNumericInGuilds < ActiveRecord::Migration[5.2]
  def change
    change_column :guilds, :guild_id, 'numeric USING CAST(guild_id AS numeric)', null: false
  end
end
