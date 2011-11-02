class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
before_filter :correct_user, :only => [:edit, :update]
before_filter :authenticate, :except => [:show, :new, :create]
  def index
    @title="All users"
    @users=User.all
  end

  def new
    @user=User.new
    @title = "Sign up"
    @alumnos=@user.alumnos_restantes
  end

  def edit
    @user=User.find(params[:id])
    @title= "Edit User"
    @alumnos=@user.alumnos_restantes
  end

 def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Alumno was successfully updated.' }
        format.json { head :ok }
      else
        @title= "edit User"
        @alumnos = @user.alumnos_restantes
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

 def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end



  def create
    @user=User.new(params[:user])
    if @user.save
      Notifier.welcome(@user).deliver
      redirect_to root_url, :notice => "Signed up!"
    else
      @title = "sign up"
      render "new"
      end
  end

   def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end


end

  private
  def authenticate
      deny_access unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])

      redirect_to(root_path, :notice => "No tienes permiso para modificar este usuario.") unless current_user?(@user) || current_user.role == "Administrador"
    end
