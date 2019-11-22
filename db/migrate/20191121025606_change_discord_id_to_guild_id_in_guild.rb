class ChangeDiscordIdToGuildIdInGuild < ActiveRecord::Migration[5.2]
  def change
    rename_column :guilds, :discord_id, :guild_id
  end
end
