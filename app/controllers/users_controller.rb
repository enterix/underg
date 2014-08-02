class UsersController < ApplicationController

  def new()
    @user = User.new
    render :layout => !pjax?
  end

  def index()
    @message = session[:user_id]
    render :layout => !pjax?
  end

  def login()
    if request.get?
      render :layout => !pjax?
    else
      session[:user_id] = params[:name]
      redirect_to users_path
    end
  end
end