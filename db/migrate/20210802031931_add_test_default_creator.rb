class AddTestDefaultCreator < ActiveRecord::Migration[6.1]
    def up
      change_column_default(:tests, :user_id, 4)
    end

    def down
      change_column_default(:tests, :user_id, nil)
    end
end
