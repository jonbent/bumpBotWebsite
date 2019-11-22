class ChangeDiscriminatorToStringInUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :discriminator, :string, limit: 4
  end
end
