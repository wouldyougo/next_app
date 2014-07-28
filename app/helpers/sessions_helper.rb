module SessionsHelper

  #Отображать строки "Find me..."
  def find_me?
    #return true
    return false
  end

  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    #cookies[:remember_token] = { value:   remember_token,
    #                             20.years.from_now.utc }
    #                             4.hours.from_now.utc }            
    user.update_attribute(:remember_token, User.encrypt(remember_token))   
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end  

  def current_user=(user)
    @current_user = user
  end  
  
  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end
  
  def current_user?(user)
    user == current_user
  end  
  
  def sign_out
    current_user.update_attribute(:remember_token,
                                  User.encrypt(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end  
  
  # Before filters
  def signed_in_user
    #redirect_to signin_url, notice: "Please sign in." unless signed_in?
    unless signed_in?
      #store_location
      flash[:notice] = "Необходи осуществить вход"
      redirect_to signin_url
      #redirect_to signin_url, notice: "Please sign in."
    end
    #К сожалению данная конструкция не работает для ключей :error и :success.
  end    
end