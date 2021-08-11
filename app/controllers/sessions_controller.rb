class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&authenticate(params[:password])
      sesion[:user_id] = user.id
      #Это аналог хэш где {ключ user_id: значение user.id}
      # по выполнению этого блока сервер отправит зашифорованную информацию
      # информация сохранится в cookie и будет действительа пока не закроется
      # браузер по умолчанию
      redirect_to(test_path)
    else
      render new
    end
  end
end
