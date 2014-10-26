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
  
  def signed_in?
    !current_user.nil?
  end
  
  def sign_out
    cookes.delete(:session_token)
    current_user = nil
    
  end
end
