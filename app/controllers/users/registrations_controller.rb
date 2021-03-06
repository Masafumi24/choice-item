# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :correct_user, only: [:edit, :update]
  before_action :set_user, only: [:edit, :update]
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_permitted_parameters, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
  end

  # PUT /resource
  def update
    @user.update(account_update_params)
    redirect_to root_path
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:account_update) do |u|
  #     u.permit(:name,
  #       :email, :image, :password, :password_confirmation)
  #   end
  # end  

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:email])
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:image])
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # def account_update_params
  #   devise_parameter_sanitizer.sanitize(:account_update)
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
