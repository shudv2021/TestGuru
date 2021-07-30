class QuestionsController < ApplicationController
  #/tests/1/questions?level=2&lang=ru
  # /tests/1/questions?data[level]=2&data[lang]=ru
  # /tests/1/questions?tegs[]=ruby&tegs[]=computer since
  #/tests/1/questions?dats[][level]=1&dats[][level]=2
  before_action :find_question, only: %i[show destroy]
  before_action :find_test, only: %i[index create]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found


  def index
    #tests/:test_id/questions
    # @test.questions.each do |question|
    #question = "<p>#{question.body}</p>"
    #  render html: question.html_safe
    #end
    questions = @test.questions.map { |question| "<p>#{question.body}</p>"}
    render html: questions.join.html_safe
  end

  def show
    #questions/id
    render html: "<p>#{@question.body}</p>".html_safe
  end

  def new
  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      render html: "<p>Question saved</p>".html_safe
    else
      render html: "<p>Saving failed</p>".html_safe
    end
  end

  def destroy
    if @question.delete
      render html: "<p>Question del</p>".html_safe
    else
      render html: "<p>Can't del question</p>".html_safe
    end
  end

  private
  def find_question
    @question = Question.find(params[:id])
  end

  def parametrs
    #byebug
    result = ["Class: #{params.class}", "Parametrs: #{params.inspect}"]
    render plain: result.join("\n")
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render html: "<p>Question not found </p>".html_safe
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
