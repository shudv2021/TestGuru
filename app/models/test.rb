class Test < ApplicationRecord

  has_many :questions
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :tests_users
  has_many :users, through: :tests_users

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level }
  # Не работает, не пойму почему????
  # validates :level, numericality: {greater_then_or_equal_to: 0}
  validates :level, numericality: { only_integer: true, greater_than: -1 }

  scope :easy, -> { where(level: 0..1) }
  scope :midle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_category, -> (category) { joins(:category)
                          .where('categories.title = ?', category) }
end
