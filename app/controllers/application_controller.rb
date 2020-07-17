class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user

    def verify_user_is_authenticated
       redirect_to '/' unless user_is_authenticated
    end 

    def user_is_authenticated
        !!current_user
    end

    def current_user
        User.find_by(id:session[:user_id])
    end

    # def logged_in?
    #     !!sessions[:user_id]
    # end 

    # def current_user
    #     @user ||= User.find(session[:user_id]) if session[:user_id]
    # end 
end
