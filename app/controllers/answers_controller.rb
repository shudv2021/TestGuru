class AnswersController < ApplicationController
  before_action :find_question, only: %i[new create]
  before_action :set_answer, only: %i[show edit update destroy]

  def show
  end

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(answer_params)
    if @answer.save
      redirect_to @answer, notice: "Answer was seccessfuly create"
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to @answer, notice: "Answer was seccessfuly chenged"
    else
      render :edit
    end
  end

  def destroy
    if @anwer.destroy
      redirect_to @answer.question
    else
      render html: "Delete error".html_safe
    end
  end


  private


  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require (:answer).permit(:body, :correct)
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

end
