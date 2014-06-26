class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user,:current_user?,:current_account

  def require_authantication
  	if current_user.nil? || current_account.nil?
    	redirect_to new_employee_sessions_url 
	end
  end

  def tab_name
    params[:controller]    
  end

  def current_user?
    current_user.present? ? true : false
  end

  private

    def current_user
      @current_user ||= Employee.find_by_id(session[:emp_id]) if session[:emp_id]
    end

    def current_account
      @current_account ||= Location.find_by_id(session[:location_id]) if session[:location_id]
    end
end
