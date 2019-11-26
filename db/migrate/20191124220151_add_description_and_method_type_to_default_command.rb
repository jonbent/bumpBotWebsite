class AddDescriptionAndMethodTypeToDefaultCommand < ActiveRecord::Migration[5.2]
  def change
    add_column :default_commands, :description, :string
    add_column :default_commands, :method_type, :string, null: false
  end
end
