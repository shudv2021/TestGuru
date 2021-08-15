
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable


  has_many :authors_test, class_name: 'Test'
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :email, presence: true, uniqueness: true, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :name, presence: true

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
