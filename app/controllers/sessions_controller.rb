class SessionsController < ApplicationController
  

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])

    if user && user.authenticate(params[:session][:password])
       session[:user_id] = user.id
       flash[:notice] = "Success!"
       redirect_to tools_path
    else
      flash.now[:error] = "Invalid"
      render :new
    end
  end

  def destroy
    sessions.clear
    redirect_to tools_path
  end

end
