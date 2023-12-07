class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_user, only: [:show, :edit, :update]

  def show
    if Avocado.exists?(user_id: @user.id)
     @avocado = @user.avocado
    end
  end

  def edit
    unless current_user.id == @user.id
      redirect_to root_path
    end
  end

  def update
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

  def set_user
    @user = User.find(params[:id])
  end
end
