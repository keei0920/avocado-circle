class PostsController < ApplicationController
  def index
  end

  def new
  end

 private

  def post_params
    params.require(:post).permit(:image, :date, :condition_id, :text).merge(user_id: current_user.id)
  end
end
