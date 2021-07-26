class User < ApplicationRecord
  def all_tests_by_level(level)
    Test.joins('JOIN tests_users ON tests_users.test_id = tests.id')
        .where('tests_users.user_id = :id AND tests.level = :level', level: level, id: id)
  end

  has_many :authors_test, class_name: 'Test'
  has_many :tests_users
  has_many :tests, through: :tests_users

  validates :name, presence: true
  validates :email, presence: true
end
