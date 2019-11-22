class CreateGuilds < ActiveRecord::Migration[5.2]
  def change
    create_table :guilds do |t|
      t.string :discord_id
      t.string :name
      t.references :user, foreign_key: true
      t.string :permissions
    end
    add_index :guilds, :discord_id
  end
end
