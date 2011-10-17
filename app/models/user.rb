    class User < ActiveRecord::Base
      TIPOS_USUARIO = ["Alumno", "Profesor", "Administrador"]

      has_one :alumno

      attr_accessor :password
      attr_accessible :email, :password, :password_confirmation, :name, :surname, :tipo



      before_save :encrypt_password



      validates_confirmation_of :password
      validates_presence_of :password, :on => :create
      validates_presence_of :email
      validates_uniqueness_of :email
      validates :tipo, :inclusion => TIPOS_USUARIO, :allow_nil => true

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
