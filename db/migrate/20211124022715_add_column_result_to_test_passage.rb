class AddColumnResultToTestPassage < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :result, :integer, null: false, default: 0
  end
end
