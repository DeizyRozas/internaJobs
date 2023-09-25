class EmployeesProfilesController < ApplicationController
  def show
    if current_user.has_role?(:employee)
      @user = User.find(params[:id])
      @applications = @user.applications
    else
      redirect_to root_path, alert: "No tienes permisos para acceder a este perfil."
    end
  end
end
