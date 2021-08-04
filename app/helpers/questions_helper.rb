module QuestionsHelper
  def question_header
    Test.find(params[:id]).title
  end
end
