class Application < ApplicationRecord
  belongs_to :user
  belongs_to :joboffer

  def exists?(joboffer_id)
    Application.where(joboffer_id: joboffer_id).exists?
  end

  def self.create_application(user, joboffer)
    application = Application.new(user: user, joboffer: joboffer)
    if application.save
      # Realizar cualquier lógica adicional aquí si es necesario
      return application
    else
      return nil
    end
  end
end
