class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :status
      t.references :test, foreign_key: true

      t.timestamps
    end
  end
end
