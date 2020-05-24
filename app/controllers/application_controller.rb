class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_user
    @user = User.find(current_user.id) if user_signed_in?
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :image])
  end
end
