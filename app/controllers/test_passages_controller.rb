class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist]

  def gist
  gist = GistQuestionService.new(@test_passage.current_question)
  gist_url = gist.call.html_url
  flash_options = if gist.seccess?
                    byebug
                    Gist.new(user_id: @test_passage.user.id, quesion_id: @test_passage.current_question.id, gist_url: gist_html)
                    #Здесь будет сохранение в sqlite3 gists
                    { notice: 'Success' }
                  else
                    {notice: 'Faled'}
                  end
  redirect_to @test_passage, flash_options
  end

  def show

  end

  def result

  end

  def update
    @test_passage.accept!(params[:answer_ids])
    TestsMailer.complited_test(@test_passage).deliver_now
    if @test_passage.complited?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private
  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
