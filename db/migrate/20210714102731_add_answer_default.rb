class AddAnswerDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:answers, :correct, true)
  end
end
