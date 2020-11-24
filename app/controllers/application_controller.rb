class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    before_action :require_user

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    def logged_in?
      !current_user.nil?
    end
    def require_user
      return if logged_in?
      flash[:danger] = 'You need to be logged in to perform that action'
      redirect_to login_path
    end
end
