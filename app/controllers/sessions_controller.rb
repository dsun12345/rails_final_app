class SessionsController < ApplicationController

  def new
  end

  def create
          @user = User.find_by(email: params[:email])
          if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
          else 
            redirect_to root_path
          end
  end 
 
  def create_by_omni_auth
      @user = User.oauth_create(auth)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
  end 

  # Clean up!
      # if @user = User.find_by(:email => oauth_email)
      #   session[:user_id] = @user.id
      #   redirect_to user_path(@user)
      # else 
      #   @user = User.new(:name => oauth_name, :email => oauth_email, :password => SecureRandom.hex)
      #   if @user.save
      #     session[:user_id] = @user.id
      #     redirect_to user_path(@user)
      #   else   
      #     raise.user.errors.messages.inspect
      #   end 
      # end 
  def destroy
      if session[:user_id].present?
        session.destroy
        redirect_to root_path
      else
        redirect_to root_path
      end 
  end 

private 

  def auth
    request.env["omniauth.auth"]["info"]
  end 


end