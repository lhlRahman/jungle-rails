class SessionsController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by_email(params[:email])
      # if user and user password exist and are correct.
      if user && user.authenticate(params[:password])
        # save user id inside browser cookie. Keeps user logged in.
        session[:user_id] = user.id
        redirect_to '/'
      else
        # if not matching user and password send back to login.
        redirect_to '/login'
      end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to '/login'
    end
  end