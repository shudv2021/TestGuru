class Test < ApplicationRecord
  def self.by_category(category)
    #category_id = Category.find_by(title:category)
    #pp Test.where(category_id: category_id).order!('id DESC')

    pp Test.joins('JOIN categories ON tests.category_id = categories.id')
           .where("categories.title = :category", category:category)
           .order('id DESC')
  end

end