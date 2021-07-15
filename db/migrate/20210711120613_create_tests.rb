class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level
      t.references :categorie, foriegn_key: true

      t.timestamps
    end
  end
end
