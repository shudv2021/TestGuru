module QuestionsHelper
  def question_header(question)
    if question.persisted?
      " Edit Question #{question.test.title} Test"
    else
      " Create Question #{question.test.title} Test"
    end
    end
end
