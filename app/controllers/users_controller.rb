class UsersController < ApplicationController

  def new()
    @user = User.new
    render :layout => !pjax?
  end

  def index()
    @message = session[:user_id]

    if(@message)
      render :layout => !pjax?
    else
      redirect_to users_login_path
    end
  end

  def login()
    if request.get?
      render :layout => !pjax?
    else
      logger.debug params[:password]
      if @user = User.where(nickname: params[:nickname], password: params[:password]).first
        session[:user_id] = @user.nickname
        redirect_to users_path
      else
        @wrong_name_or_pass = true
        render :layout => !pjax?
      end
    end
  end

  def ajaxNickChecker
    if User.where(nickname: params[:nickname]).first
      render :text => "false"
    else
      render :text => "true"
    end
  end

  def ajaxEmailChecker
    if User.where(email: params[:email]).first
      render :text => "false"
    else
      render :text => "true"
    end
  end

  def logout()
    reset_session
  end

  def create()
    @user = User.new(user_params)
    langs = Language.find([params[:user][:lang_1], params[:user][:lang_2], params[:user][:lang_3]].uniq!)
    @user.languages = langs if langs

    logger.debug(@user.languages.include? Language.where(id: params[:user][:lang_2]))
    logger.debug "====================================================================================================================================="

    if(!@user.save)
      render 'new', :layout => !pjax?
    else
      redirect_to users_login_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :password, :password_confirmation,
                                 :email, :date_of_birth, :sex)
  end
end
