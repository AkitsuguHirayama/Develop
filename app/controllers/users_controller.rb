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
  
  def update
    # binding.pry
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to edit_user_path, success: 'プロフィールを更新しました'
    else
      flash.now[:danger] = "プロフィールの更新に失敗しました"
      render :edit
    end
  end
  
  def show
    # @user = User.where(user_id: current_user.id)
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
    # params.require(:user).permit(:name, :email, :password, :password_confirmation, :birthday, :pregnantday)
    params.require(:user).permit(:birthday, :pregnantday)
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  

  # before_action :set_user, only: [:show]

  

  private
  def set_user
    @user = User.find([:id])
  end
  
end
