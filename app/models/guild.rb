class Guild < ApplicationRecord
    validates :guild_id, :user_id, presence: true
    belongs_to :user

    def self.generate_image_url(guild_object)
        if !guild_object["icon"]
            return ActionController::Base.helpers.asset_path('1510200817001.png')
        else 
            return "https://cdn.discordapp.com/icons/#{guild_object["id"]}/#{guild_object["icon"]}?size=220x220"
        end
    end
end
