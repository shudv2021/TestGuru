class Answer < ApplicationRecord
  belongs_to :question
  scope :right, ->{ where(correct: true).order(question_id: :desc)}
end
