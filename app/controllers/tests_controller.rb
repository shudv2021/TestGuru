class TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_test, only: %i[start]
  before_action :test_ready?, only: %i[start]

  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_ready?
    if @test.questions.empty?
    redirect_to tests_path, alert: "This test isn't ready. Use other test."
    else
      @test.questions.each  do |question|
        redirect_to tests_path, alert: "This test isn't ready.Use other test" if question.answers.empty?
      end
    end
  end

end
