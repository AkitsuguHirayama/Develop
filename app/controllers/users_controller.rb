class UsersController < ApplicationController
  def index
   
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  def edit
    # binding.pry
    @user = User.find(params[:id])
  end
  
  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end
  
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  

  # before_action :set_user, only: [:show]

  def show
    # @user = User.where(user_id: current_user.id)
  end

  private
  def set_user
    @user = User.find([:id])
  end
  
end
