class DefaultCommand < ApplicationRecord
    has_many :command_params,
    dependent: :destroy
    has_many :guild_commands,
    dependent: :destroy
end
