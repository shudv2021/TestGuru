class AddTableGists < ActiveRecord::Migration[6.1]
  def change
    create_table :gists do |t|
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true
      t.string :gits_url
    end
  end
end
