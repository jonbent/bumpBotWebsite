class CommandParam < ApplicationRecord
  validates :param_key, :param_value, :default_command_id, :optional, presence: true
  validates :default_command_id, uniqueness: {
    scope: [:param_key, :param_value],
    message: "Command Params cannot be a duplicate"
  }
  belongs_to :default_command
end
