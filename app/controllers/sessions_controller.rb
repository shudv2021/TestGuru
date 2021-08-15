class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      #Это аналог хэш где {ключ user_id: значение user.id}
      # по выполнению этого блока сервер отправит зашифорованную информацию
      # информация сохранится в cookie и будет действительа пока не закроется
      # браузер по умолчанию
      redirect_to cookies[:path_from_request] || root_path
    else
      flash.now[:alert] = ' Uncorrect email or password'
      render :new
    end
  end

  def destroy
    flash[:alert] = "You Exit TestGuru"
  end

end
