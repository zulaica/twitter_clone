class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def authenticate_user
    unless user_signed_in?
      flash[:alert] = "You must be signed in to do that."
      redirect_to new_user_session_path
    end
  end

protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |user| user.permit(:username, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:sign_in) { |user| user.permit(:email, :password) }
  end
end
