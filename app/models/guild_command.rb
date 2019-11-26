class GuildCommand < ApplicationRecord
  validates :guild_id, :enabled, presence: true
  belongs_to :guild
  belongs_to :default_command
  has_many :command_params,
    through: :default_command,
    source: :command_params
end
