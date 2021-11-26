class AddColumnResultToTestPassage < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :result, :boolean, default: false, null: false
  end
end
