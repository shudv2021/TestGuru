class User < ApplicationRecord
  def all_tests_by_level(level)
    tests.where('tests.level=?', level)
  end

  def all_tests
    user.tests
  end

  has_many :authors_test, class_name: 'Test'
  has_many :tests_users
  has_many :tests, through: :tests_users

  validates :name, presence: true
  validates :email, presence: true
end
