    class User < ActiveRecord::Base
      TIPOS_USUARIO = ["Alumno", "Profesor", "Administrador"]

      belongs_to :alumno
      belongs_to :profesor

      attr_accessor :password
      attr_accessible :email, :password, :password_confirmation, :name, :surname, :tipo, :alumno_id



      before_save :encrypt_password
      #before_validation :asignar_nombre
      validates_confirmation_of :password
      validates_presence_of :password, :on => :create
      validates_presence_of :email
      validates_uniqueness_of :email
      validates :tipo, :inclusion => TIPOS_USUARIO, :allow_nil => true

      def alumnos_restantes
        ids = Alumno.all.map{|a| a.id}
        ids_a_eliminar=User.all.map{|a| a.alumno_id}.compact
        ids_a_mostrar= ids - ids_a_eliminar
        ids_a_mostrar << self.alumno_id
        ids_a_mostrar.compact
        Alumno.find(ids_a_mostrar)
      end

      def encrypt_password
        if password.present?
          self.password_salt = BCrypt::Engine.generate_salt
          self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
        end
      end
      def self.authenticate(email, password)
         user = find_by_email(email)
         if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
          user
         else
           nil
         end
      end
    end
