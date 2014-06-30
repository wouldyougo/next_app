class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user
      user.send_password_reset
      # redirect_to root_url, :notice => "Email sent with password reset instructions."
      redirect_to signin_url, :notice => "Email для сброса пароля отправлен."
    else
      redirect_to new_password_reset_path, :alert => "Укажите email для восстановления пароля."
    end
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  # не используется
  def update_v2
    @user = User.find_by_password_reset_token!(params[:id])

    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Password reset has expired."
    elsif @user.update_attributes(params[:user])
      redirect_to root_url, :notice => "Password has been reset!"
    else
      render :edit
    end
  end

  # Это будет проходить, пока в параметрах есть ключ user, иначе будет
  # вызвано исключение ActionController::ParameterMissing, которое будет
  # поймано в ActionController::Base и превращено в отклик 400 Bad Request.
  def update
    @user = User.find_by_password_reset_token!(params[:id])

    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Ссылка для сброса пароля устарела."
    elsif @user.update_attributes(password_params)
      @user.update_attribute(:password_reset_token, nil)
      #redirect_to root_url, :notice => "Password has been reset!"
      redirect_to signin_url, :notice => "Пароль был успешно изменен!"
    else
      render :edit
    end
    #user.update_attributes(password: "admin",
    #                       password_confirmation: "admin")
  end

  private
  # Использование приватного метода для инкапсуляции разрешенных параметров -
  # это всего лишь хороший паттерн, с помощью которого можно повторно
  # использовать тот же самый список разрешений при создании и обновлении
  # Этот метод также можно адаптировать к проверке разрешенных атрибутов для
  # определенных пользователей.
  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
