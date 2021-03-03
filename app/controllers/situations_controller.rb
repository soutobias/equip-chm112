class SituationsController < ApplicationController

  before_action :set_situation, only: [:update, :destroy]

  def create
    @situation = Situation.new(situation_params)
    authorize @situation
    @situation.id = Situation.maximum(:id) + 1
    @situation.save
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
    @situation.update(situation_params)
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
      @situation.destroy
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

  def set_situation
    @situation = Situation.find(params[:id])
    authorize @situation
  end

  def situation_params
    params.require(:situation).permit(:status.downcase)
  end
end
