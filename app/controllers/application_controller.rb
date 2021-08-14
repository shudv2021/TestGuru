class ApplicationController < ActionController::Base
  #Theis method made able method :current_usar in all controllers
  helper_method :current_user,
                :logged_in?,
                :exit_from_session

  private
  def authenticate_user!
    cookies[:path_from_request] = request.fullpath
    unless current_user
      redirect_to login_path, alert: "Email or password are uncorrect. Try another one."
    end
  end

  def exit_from_session
    redirect_to login_path
    session[:user_id] = nil
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    @current_user.present?
  end

end
