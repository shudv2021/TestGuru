class AddCategoryNullConstraing < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:categories, :category_title, false)
  end
end
