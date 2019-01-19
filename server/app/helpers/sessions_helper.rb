module SessionsHelper
  # Logs in the user.
  def log_in(user)
  session[:user_id] = user.id
  end

  # Logs out the current user.
  def log_out
  forget(current_user)
  session.delete(:user_id)
  @current_user = nil
  end

  #current logged in user corresponding to the remember_token cookie
  def current_user
  if (user_id = session[:user_id])
  @current_user ||= User.find_by(id: user_id)
  elsif (user_id = cookies.signed[:user_id])
  user = User.find_by(id: user_id)
  if user && user.authenticated?(:remember, cookies[:remember_token])
  log_in user
  @current_user = user
  end
  end
  end

  # Returns true if the user is logged in, else false.
  def logged_in?
  !current_user.nil?
  end

  # Remembers a logged in user
  def remember(user)
  user.remember
  cookies.permanent.signed[:user_id] = user.id
  cookies.permanent[:remember_token] = user.remember_token
  end

  # Forgets a logged in user.
  def forget(user)
  user.forget
  cookies.delete(:user_id)
  cookies.delete(:remember_token)
  end

end
