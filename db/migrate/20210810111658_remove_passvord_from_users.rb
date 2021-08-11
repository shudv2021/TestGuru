class RemovePassvordFromUsers < ActiveRecord::Migration[6.1]
  def up
    remove_column :users, :password, :string
    remove_column :users, :status, :string
  end
end
