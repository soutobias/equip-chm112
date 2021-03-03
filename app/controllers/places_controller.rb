class PlacesController < ApplicationController

  before_action :set_place, only: [:update, :destroy]

  def create
    @place = Place.new(place_params)
    authorize @place
    @place.id = Place.maximum(:id) + 1
    @place.save
    @situations = policy_scope(Situation)
    @places = policy_scope(Place)
    @items = policy_scope(Item)
    @item_types = policy_scope(ItemType)
    @place = Place.new()
    @situation = Situation.new()
    @item = Item.new()
    @item_type = ItemType.new()
    redirect_to admin_path
  end

  def update
    @place.update(place_params)
    @situations = policy_scope(Situation)
    @places = policy_scope(Place)
    @items = policy_scope(Item)
    @item_types = policy_scope(ItemType)
    @place = Place.new()
    @situation = Situation.new()
    @item = Item.new()
    @item_type = ItemType.new()
    redirect_to admin_path
  end

  def destroy
    begin
      @place.destroy
    rescue
    end
    @situations = policy_scope(Situation)
    @places = policy_scope(Place)
    @items = policy_scope(Item)
    @item_types = policy_scope(ItemType)
    @place = Place.new()
    @situation = Situation.new()
    @item = Item.new()
    @item_type = ItemType.new()
    redirect_to admin_path
  end

  private

  def set_place
    @place = Place.find(params[:id])
    authorize @place
  end

  def place_params
    params.require(:place).permit(:place.downcase)
  end
end
