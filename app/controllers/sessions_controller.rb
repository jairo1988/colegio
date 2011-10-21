    class SessionsController < ApplicationController
      def new
        @title = "Sign in"
      end

      def create
        user = User.authenticate(params[:acceso], params[:password])
        if user
          session[:user_id] = user.id
          redirect_to root_url, :notice => "Conexion establecida satisfactoriamente ^.^"
        else
          flash.now.alert = "Invalid email or password"
          render "new"
        end
      end

      def destroy
        session[:user_id]=nil
        redirect_to root_url, :notice => "Desconectado de manera segura ^.^ "
      end
    end
