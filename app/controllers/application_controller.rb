class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include CanCan::ControllerAdditions

  def authenticate_user!
    redirect_to new_session_path, alert: 'please sign in' unless user_signed_in?
  end

  def user_signed_in?
    session[:user_id].present?
  end
  helper_method :user_signed_in?
  # make this accessible to all view files

  def current_user
    User.find session[:user_id] if user_signed_in?
  end
  helper_method :current_user
  # adding the line above makes this methods accessible in every view file

private

  def configure_permitted_parameters
    update_attrs = [:password, :password_confirmation, :current_password]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end
end
