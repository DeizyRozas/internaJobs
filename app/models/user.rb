class User < ApplicationRecord
  rolify
  after_create :assign_default_role

  def assign_default_role
    add_role(:employee) if roles.blank? # Asignar el rol de "empleado" si el usuario no tiene roles
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

        has_many :applications
        has_many :joboffers, through: :applications 
        has_one_attached :profile_picture

        def apply_to(job_offer)
          # Verificar si el usuario ya se ha postulado a esta oferta de trabajo
          if applications.exists?(joboffer_id: job_offer.id)
            errors.add(:base, "Ya te has postulado a esta oferta de trabajo")
          else
            # Crear la relación entre el usuario y la oferta de trabajo
            applications.create(joboffer: job_offer)
          end
        end


        def has_applied_to?(job_offer)
          applications.exists?(joboffer_id: job_offer.id)
        end

end
