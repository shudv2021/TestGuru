class Test < ApplicationRecord
  def self.by_category(category)
    category_id = Category.find_by(title:category)
    pp Test.where(category_id: category_id).order!('id DESC')

    #  Test.joins('JOIN categories ON tests.category_id = categories.id').where("category = :category", category:category)
  end
end
