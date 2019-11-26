class ChangeClassToCommandClassInGuildCommands < ActiveRecord::Migration[5.2]
  def change
    rename_column :guild_commands, :class, :command_class
  end
end
