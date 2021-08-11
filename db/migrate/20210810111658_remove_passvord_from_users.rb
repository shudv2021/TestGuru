class RemovePassvordFromUsers < ActiveRecord::Migration[6.1]
  def up
    remove_column :users, :password, :string
  end
end
