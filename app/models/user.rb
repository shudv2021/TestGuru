class User < ApplicationRecord
  def all_tests_by_level(level)
    Test.joins('JOIN test_actions ON test_actions.test_id = tests.id')
              .where('test_actions.user_id = :id AND tests.level = :level', level:level, id:self.id)
  end

  #has_and_belongs_to_many :tests
  has_many :tests_users
  has_many :tests, through: :tests_users
end
