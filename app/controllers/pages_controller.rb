class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def admin
    @situations = policy_scope(Situation)
    @places = policy_scope(Place)
    @items = policy_scope(Item)
    @item_types = policy_scope(ItemType)
    @place = Place.new()
    @situation = Situation.new()
    @item = Item.new()
    @item_type = ItemType.new()
  end
end
