class PlantsController < ApplicationController
  def new #GET
    @garden = Garden.find(params[:garden_id])
    @plant = Plant.new
    # raise
  end

  def create
     #1. grab again the id of the parent in the url
     @garden = Garden.find(params[:garden_id])
    # 2.create the instance of plant with the params of the user
     @plant = Plant.new(strong_params_plant)
     # 3.I'm assigning the parent id to the child instance
     @plant.garden_id = @garden.id #i m assigning the id of the garden from the url as the garden_id to my plant instance
     # @plant.garden = @garden #magic from RAILS & ACTIVE RECORD
     # raise
     if @plant.save #returns a boolean : true, false
      redirect_to garden_path(@garden)
     else
      render :new #rendering the action new with the info of the user
     end
  end

  def destroy
    # 1.grab the instance you want to delete from the url (parametized url)
    @plant = Plant.find(params[:id])
    # 2.destroy it
    @plant.destroy
    # 3. redirect the user
    redirect_to garden_path(@plant.garden)
  end


  private

  def strong_params_plant
    params.require(:plant).permit(:name, :image_url, :price)
  end

end
