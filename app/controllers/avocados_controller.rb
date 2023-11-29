class AvocadosController < ApplicationController
  def new
    @avocado = Avocado.new
  end

  def create
    @avocado = Avocado.new(avocado_params)
   if @avocado.save
    redirect_to users_show_path
   else
    render :new, status: :unprocessable_entity
   end
  end

  def edit 
    @avocado = Avocado.find(params[:id])
  end

  def update
    @avocado = Avocado.find(params[:id])
    if @avocado.update(avocado_params)
      redirect_to users_show_path
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private

  def avocado_params
    params.require(:avocado).permit(:name, :birth_day, :watering, :fertilizer, :transplant).merge(user_id: current_user.id)
  end
end
