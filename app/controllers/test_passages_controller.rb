class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist]

  def gist
  gist = GistQuestionService.new(@test_passage.current_question).call
  byebug
  flash_options = if gist.seccess?
                    current_user.gists.create(quesion_id: @test_passage.current_question.id, gits_url: gist.html_url)
                    { notice: 'Success', url: gist.html_url }
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
