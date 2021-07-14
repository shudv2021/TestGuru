class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.integer :test_id
      t.string :body

      t.timestamps
    end
  end
end
