class Test < ApplicationRecord

  has_many :questions, dependent: :destroy
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages


  validates :title, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: -1 }

  scope :easy, -> { where(level: 0..1) }
  scope :midle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_category, -> (category) { joins(:category)
                          .where('categories.title = ?', category) }

  def self.by_category_sort
    by_category.order(id: :desc).pluck(:title)
  end

  def t_r?
    if self.questions.empty?
      return false
    else
      self.questions.each  do |question|
        return false if question.answers.empty?
      end
    end
  true
  end

end
