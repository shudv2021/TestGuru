class RemoveStatusFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :status, :string
  end
end
