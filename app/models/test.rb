class Test < ApplicationRecord
  def self.by_category(category)
    pp Test.joins('JOIN categories ON tests.category_id = categories.id')
           .where("categories.title = :category", category:category)
           .order('tests.id DESC')
  end
end
