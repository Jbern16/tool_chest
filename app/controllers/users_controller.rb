class UsersController < ApplicationController


  def index
    if session[:user_id]
      @user = User.find_by(session[:user_id])
      redirect_to user_tools
    else
      redirect_to tools_path
    end
  end

  def show
    @user = User.find_by(params[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end



end
