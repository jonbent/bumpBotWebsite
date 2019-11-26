class Guild < ApplicationRecord
    validates :guild_id, :user_id, :prefix, presence: true
    belongs_to :user
    has_many :guild_commands
    has_many :default_commands,
        through: :guild_commands,
        source: :default_command

    has_many :command_params,
        through: :default_commands,
        source: :command_params

    def self.generate_image_url(guild_object)
        if !guild_object["icon"]
            return ActionController::Base.helpers.asset_path('1510200817001.png')
        else 
            return "https://cdn.discordapp.com/icons/#{guild_object["id"]}/#{guild_object["icon"]}?size=220x220"
        end
    end
end
