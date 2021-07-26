class Test < ApplicationRecord
=begin
  def self.by_category(category)
    pp Test.joins('JOIN categories ON tests.category_id = categories.id')
           .where("categories.title = :category", category:category)
           .order('tests.id DESC')
  end
=end

  has_many :questions
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: 'user_id'
  has_many :tests_users
  has_many :users, through: :tests_users
  scope :easy, ->{ where(level: 0..1).order(created_at: :desc)}
  scope :midle, ->{ where(level: 2..4).order(created_at: :desc)}
  scope :hard, ->{where(level: 5..Float::INFINITY).order(creater_at: :desc)}
  scope :by_category, ->(category){ select('tests.title')
                                     .joins(:category)
                                     .where('categories.title=?', category)}
end
