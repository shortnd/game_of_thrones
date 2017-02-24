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
    @character = Character.new(character_params)
    @character.house = House.find_by(name: params[:character][:house])
    @character.save
    redirect_to character_path(@character)
  end


  private

  def character_params
    params.require(:character).permit(:name, :house_id, :img_url)
  end
end
