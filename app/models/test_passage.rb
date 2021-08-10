class TestPassage < ApplicationRecord
  BORDER_OF_SECCESS = 85.freeze

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  before_validation :before_validation_set_the_first_question, on: :create
  before_update :next_question

  def accept!(answers_ids)
    if correct_answer?(answers_ids)
      self.correct_questions +=1
    end
    save!
  end

  def complited?
    current_question.nil?
  end

  def result?
    ((self.correct_questions.to_f / test.questions.count) * 100).round
  end

  def seccessfull?
    result? >= BORDER_OF_SECCESS
  end

  def question_num
    "вопрос номер: #{test.questions.index(self.current_question) + 1} из #{test.questions.count} "
  end

  private
  def before_validation_set_the_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    #Экономими время многократные запросы к базе
    (correct_answers_count == correct_answers.where(id: answer_ids).count) && (correct_answers_count == answer_ids.count)
  end

  def next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def correct_answers
    current_question.answers.correct
  end

end
