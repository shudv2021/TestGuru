class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist]

  def gist
  gist = GistQuestionService.new(@test_passage.current_question)
  gist.call
  flash_options = if gist.success?
                    current_user.gists.create(question_id: @test_passage.current_question.id, gist_url: gist.html_url)
                    { notice: 'Success' }
                  else
                    { notice: 'Faled' }
                  end
  redirect_to @test_passage, flash_options
  end

  def show

  end

  def result

  end

  def update
    if @test_passage.complited?
      redirect_to result_test_passage_path(@test_passage)
    else
      @test_passage.accept!(params[:answer_ids])
      render :show
    end
  end

  private
  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
