require 'digest/sha1'
class User < ApplicationRecord

  include Auth

  has_many :authors_test, class_name: 'Test'
  has_many :test_passages
  has_many :tests, through: :test_passages

  def all_tests_by_level(level)
    tests.where('tests.level=?', level)
  end

  def all_tests
    user.tests
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
