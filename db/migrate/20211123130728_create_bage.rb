class CreateBage < ActiveRecord::Migration[6.1]
  def change
    create_table :bages do |t|
      t.string :name
      t.string :image
      t.bulean :usage
      t.timestamps
    end
  end
end
