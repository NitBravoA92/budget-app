class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # redirect to categories page when user is logged in
  def after_sign_in_path_for(_resource)
    categories_path
  end

  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:name, :email, :password, :password_confirmation)
    end
  end
end
