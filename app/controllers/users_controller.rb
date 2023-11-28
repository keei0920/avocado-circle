class UsersController < ApplicationController
  def show
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to users_show_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :purpose_id, :prefecture_id, :introduce)
  end
end
