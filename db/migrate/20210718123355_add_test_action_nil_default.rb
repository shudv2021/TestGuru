class AddTestActionNilDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:test_actions, :test_id, false)
    change_column_null(:test_actions, :user_id, false)
    change_column_null(:test_actions, :result, false)
  end
end
