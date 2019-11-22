class CreateUserCommands < ActiveRecord::Migration[5.2]
  def change
    create_table :user_commands do |t|
      t.references :user, foreign_key: true
      t.string :class
      t.string :method
      t.string :prefix

      t.timestamps
    end
    add_index :user_commands, :method
  end
end
