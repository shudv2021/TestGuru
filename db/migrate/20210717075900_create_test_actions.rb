class CreateTestActions < ActiveRecord::Migration[6.1]
  def change
    create_table :test_actions do |t|
      t.references :test, foreign_key:true
      t.references :user, foreign_key:true
      t.integer :result

      t.timestamps
    end
  end
end
