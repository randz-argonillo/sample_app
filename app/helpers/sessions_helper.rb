module SessionsHelper
  
  def sign_in(user)
    cookies.permanent[:session_token] = user.remember_token
    self.current_user = user 
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:session_token])
  end
  
  def sign_in?
    !current_user.nil?
  end
end
