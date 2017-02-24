class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def show
    @character = Character.find(params[:id])
  end

  def new
    @character = Character.new
    @house_house = House.all.map{ |house| house.name}
  end

  def create
    @character = Character.create(character_params)

    @character.save

    redirect_to characters_path(@character)
  end


  private

  def character_params
    params.require(:character).permit(:name, :house_id)
  end
end
