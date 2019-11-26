class ChangeGuildIdToBigIntInGuilds < ActiveRecord::Migration[5.2]
  def change
    change_column :guilds, :guild_id, :bigint, null: false
  end
end
