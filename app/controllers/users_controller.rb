class UsersController < ApplicationController
  before_action :authenticate_user, only:[:edit, :destroy]
  
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
  
  def show
    @user = User.find_by(id: params[:id])
    @topics = @user.topics
    
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), success: '登録内容を変更しました'
    else
      flash.now[:danger] = "登録内容を変更できませんでした"
      render :edit
    end
  end
  
  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    redirect_to root_path, danger: 'アカウントを消去しました'
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email,:password, :password_confirmation)
  end
end
