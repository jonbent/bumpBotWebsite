class AddDefaultCommandToCommandParams < ActiveRecord::Migration[5.2]
  def change
    add_reference :command_params, :default_command, foreign_key: true
  end
end
