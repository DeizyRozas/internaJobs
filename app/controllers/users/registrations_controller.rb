# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
skip_before_action :require_no_authentication, only: [:new, :create]
  before_action :authenticate_user!, only: [:new, :create]
  before_action :check_admin, only: [:new, :create]
  before_action :configure_account_update_params, only: [:update]

  private

  def check_admin
    unless current_user.has_role?(:admin)
      redirect_to root_path, alert: "Solo el administrador puede crear nuevos perfiles de empleados."
    end
  end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end
  def update
    @user = current_user

    # Valida los datos del formulario
    if @user.update(user_params)
      # Actualiza la imagen del perfil
      @user.profile_picture.attach(params[:user][:profile_picture])

      # Redirecciona al usuario a su perfil
      redirect_to user_path(@user)
    else
      # Muestra los errores del formulario
      render :edit
    end
  end

  private

  # Obtiene los datos del formulario
  def user_params
    params.require(:user).permit(:profile_picture)
  end


  # PUT /resource
  # def update
  #   super
  # end

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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
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
