class CreateCommandParams < ActiveRecord::Migration[5.2]
  def change
    create_table :command_params do |t|
      t.string :param_key, null: false
      t.string :param_value, null: false
      t.boolean :optional, null: false, default: true
      t.references :user_command, foreign_key: true

      t.timestamps
    end
  end
end
