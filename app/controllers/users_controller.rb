class UsersController < ApplicationController
  def new
  end

  def create
  end

  def index
    @books = Book.all
    @users = User.all
    @user = current_user
    @book = Book.new #渡す値を設定
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id:params[:id])
    @book = Book.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end

end
