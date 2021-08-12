class ApplicationController < ActionController::Base
  #Theis method made able method :current_usar in all controllers
  helper_method :current_user,
                :logged_in?,
                :exit_from_session

  private
  def authenticate_user!
    unless current_user
      redirect_to login_path, alert: "Uncorrect information in form. Try another one."
    end
  end
  def exit_from_session
    @current_user = nil
    redirect_to login_path
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    @current_user.present?
  end



end
