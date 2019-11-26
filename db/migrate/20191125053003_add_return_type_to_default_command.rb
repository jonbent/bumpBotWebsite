class AddReturnTypeToDefaultCommand < ActiveRecord::Migration[5.2]
  def change
    add_column :default_commands, :return_type, :string
  end
end
