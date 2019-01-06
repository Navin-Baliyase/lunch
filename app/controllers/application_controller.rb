class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  private

  def current_user
    @current_user ||= Employee.find(session[:employee_id]) if session[:employee_id]
  end
end
