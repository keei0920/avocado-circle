class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if Avocado.exists?(user_id: @user.id)
      @avocado = Avocado.find(@user.id)
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:nickname, :email, :purpose_id, :prefecture_id, :introduce)
  end
end
