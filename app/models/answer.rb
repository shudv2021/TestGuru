class Answer < ApplicationRecord
  belongs_to :question

  validate :too_many_answers, on: :create
  validates :body, presence: true

  scope :right, -> { where(correct: true) }

  private

  def too_many_answers
    errors.add(:question_id, 'To many answers for this question') if total_answers >= 4
  end

  def total_answers
    Answer.where('question_id = ?', question_id).size
  end
end
