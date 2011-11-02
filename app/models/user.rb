    class User < ActiveRecord::Base
      #TIPOS_USUARIO = ["Alumno", "Profesor", "Administrador"]

      belongs_to :logable, :polymorphic => true

      attr_accessor :password
      attr_accessible :password, :password_confirmation, :username, :emailuji, :alumno_id, :photo

      before_save :encrypt_password
      validates_confirmation_of :password
      validates_presence_of :password, :on => :create
      validates :username, :presence => true
      validates :emailuji, :presence =>true, :format => { :with => /\A[a-zA-Z0-9_.]+@[a-z.]+\z/i,  :message => "The correct email format is name@server.com"}

       # Paperclip
      has_attached_file :photo,
        :styles => {
          :thumb => "50x50#", :small => "50x50>"}
      # Validaciones de Paperclip
      validates_attachment_size :photo, :less_than => 2.megabytes
      validates_attachment_content_type :photo, :content_type => ['image/jpeg','image/png']

      #validates :tipo, :inclusion => TIPOS_USUARIO, :allow_nil => true

      def alumnos_restantes
        ids = Alumno.all.map{|a| a.id}
        ids_a_eliminar=User.all.map{|a| a.alumno_id}.compact
        ids_a_mostrar= ids - ids_a_eliminar
        ids_a_mostrar << self.alumno_id
        ids_a_mostrar.compact
        if false && !ids_a_mostrar.empty?
        Alumno.find(ids_a_mostrar)
        else
          []
        end
      end

      def encrypt_password
        if password.present?
          self.password_salt = BCrypt::Engine.generate_salt
          self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
        end
      end

      def self.authenticate(acceso, password)
         user = find_by_username(acceso)
         user = find_by_emailuji(acceso) unless user
         if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
          user
         else
           nil
         end
      end

      def role
        self.logable_type || "Administrador"
      end

      def alumno?
        role == "Alumno"
      end

      def profesor?
        role == "Profesor"
      end

      def administrador?
        role == "Administrador"
      end

    end
# == Schema Information
#
# Table name: users
#
#  id            :integer         not null, primary key
#  email         :string(255)
#  password_hash :string(255)
#  password_salt :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  name          :string(255)
#  surname       :string(255)
#  tipo          :string(255)
#  admin         :boolean         default(FALSE)
#  alumno_id     :integer
#  profesor_id   :integer
#

