class ApplicationController < ActionController::Base
    def index
        # Lógica para obtener y mostrar las postulaciones
        @applications = Application.all
    end

    def create
      @joboffer = Joboffer.find(params[:joboffer_id])
      application = Application.create_application(current_user, @joboffer)
  
      if application
        redirect_to @job_offer, notice: 'Has aplicado a la oferta de trabajo correctamente.'
      else
        redirect_to @job_offer
      end
    end


    
end
