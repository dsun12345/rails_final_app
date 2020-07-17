class SessionsController < ApplicationController

  def new
  end

  def create
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to museums_path
      else 
        redirect_to root_path
      end 
  end 

  def destroy
      if session[:user_id].present?
        session.destroy
        redirect_to root_path
      else
        redirect_to root_path
      end 
  end 
  # def create
  #   @user = User.find_by(email: params[:email])
  #   if @user && @user.authenticate(params[:password])
  #     session[:user_id] = @user.id
  #     redirect_to
  #   else
  #     redirect_to
  #   end
  # end

end