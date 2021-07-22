class Test < ApplicationRecord
  def self.by_category(category)
    pp Test.joins('JOIN categories ON tests.category_id = categories.id')
           .where("categories.title = :category", category:category)
           .order('tests.id DESC')
  end
  has_many :questions
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: 'user_id'
  #has_and_belongs_to_many :users
  has_many :tests_users
  has_many :users, through: :tests_users
end
