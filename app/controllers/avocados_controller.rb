class AvocadosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_avocado, only: [:edit, :update]

  def new
    @avocado = Avocado.new
  end

  def create
    @avocado = Avocado.new(avocado_params)
    if @avocado.save
      redirect_to user_path(@avocado.user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    return if current_user.id == @avocado.user_id

    redirect_to root_path
  end

  def update
    if @avocado.update(avocado_params)
      redirect_to user_path(@avocado.user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def avocado_params
    params.require(:avocado).permit(:name, :birth_day, :watering, :fertilizer, :transplant).merge(user_id: current_user.id)
  end

  def set_avocado
    @avocado = Avocado.find(params[:id])
  end
end
