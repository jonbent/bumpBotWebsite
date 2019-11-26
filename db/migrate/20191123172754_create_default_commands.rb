class CreateDefaultCommands < ActiveRecord::Migration[5.2]
  def change
    create_table :default_commands do |t|
      t.string :class_name, null: false
      t.string :method_name, null: false

      t.timestamps
    end
  end
end
