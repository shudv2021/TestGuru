class User < ApplicationRecord
  def all_tests_by_level(level)
    TestAction.joins('JOIN tests ON test_actions.test_id = tests.id')
              .where('test_actions.user_id = :id AND tests.level = :level', level:level, id:self.id)
  end
end