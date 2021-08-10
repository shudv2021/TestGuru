class User < ApplicationRecord
  def all_tests_by_level(level)
    tests.where('tests.level=?', level)
  end

  def all_tests
    user.tests
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  has_many :authors_test, class_name: 'Test'
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :name, presence: true
  validates :email, presence: true
end
