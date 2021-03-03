class ItemsController < ApplicationController

  before_action :set_item, only: [:update, :destroy]

  def create
    @item = Item.new(item_params)
    authorize @item
    @item.id = Item.maximum(:id) + 1
    @item.save
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
    @item.update(item_params)
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
      @item.destroy
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

  def set_item
    @item = Item.find(params[:id])
    authorize @item
  end

  def item_params
    params.require(:item).permit(:item.downcase)
  end
end
