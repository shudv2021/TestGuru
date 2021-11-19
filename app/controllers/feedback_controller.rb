
class FeedbackController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    report = params[:report]
    if report.empty?
      flash[:notice] = "Message can't be blank"
      render :index
    else
      FeedbackMailer.send_report(current_user, report).deliver_now
      flash[:notice] = 'You send report to Admin'
      redirect_to root_path
    end
  end

end
