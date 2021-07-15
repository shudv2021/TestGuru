class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.references :test, foriegn_key: true
      t.string :body

      t.timestamps
    end
  end
end
