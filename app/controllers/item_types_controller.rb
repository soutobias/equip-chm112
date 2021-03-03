class ItemTypesController < ApplicationController

  before_action :set_item_type, only: [:update, :destroy]

  def create
    @item_type = ItemType.new(item_type_params)
    authorize @item_type
    @item_type.id = ItemType.maximum(:id) + 1
    @item_type.save
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
    @item_type.update(item_type_params)
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
      @item_type.destroy
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

  def set_item_type
    @item_type = ItemType.find(params[:id])
    authorize @item_type
  end

  def item_type_params
    params.require(:item_type).permit(:item_type.downcase, :item_id)
  end
end
