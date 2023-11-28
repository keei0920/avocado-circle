class UsersController < ApplicationController
  def show
  end

  def edit
    @uesr = current_user.id
  end

  def update
    if current_user.update(user_params)
      redirect_to users_show_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:nickname, :email, :purpose_id, :prefecture_id, :introduce)
  end
end
