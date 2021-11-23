class CreateUserBage < ActiveRecord::Migration[6.1]
  def change
    create_table :user_bages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bage, null: false, foreign_key: true
      t.timestamps
    end
  end
end
