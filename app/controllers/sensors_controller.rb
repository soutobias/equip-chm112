class SensorsController < ApplicationController

  before_action :set_sensor, only: [:show, :edit, :update, :destroy]

  def index
    # if params[:commit].present?
    #   @price = params[:item]
    #   @commit = params[:subitem]
    #   @skill = params[:situation]
    #   @experience = params[:place]
    #   query = ""
    #   if params[:item] != ""
    #     query += "item = #{params[:price].to_i} AND "
    #   end
    #   if params[:experience] != ""
    #     query += "experience >= #{params[:experience].to_i} AND "
    #   end
    #   if params[:skill] != "Selecione uma habilidade"
    #     query += "skill = '#{params[:skill]}' AND "
    #   end
    #   if query != ""
    #     query = query[0..-5]
    #     @sensors = policy_scope(Sensor).where(query).order(order_param)
    #   else
    #     @sensors = policy_scope(Sensor).order(order_param)
    #   end
    # else
    #   @sensors = policy_scope(Sensor).order(order_param)
    # end
    if params[:sort].present?
      @sensors = policy_scope(Sensor).includes(:situation,
        :place, :item, :item_type).order(params[:sort])
    else
      @sensors = policy_scope(Sensor).includes(:situation, :place, :item, :item_type)
      # @sensors = policy_scope(Sensor)
    end

    @situations = Situation.all
    @places = Place.all
    @items = Item.all
    @item_types = ItemType.all
  end

  def new
    authorize @sensor
    render :show
  end

  def create
    @sensor = Sensor.new(sensor_params)
    authorize @sensor
    if @sensor.save
      redirect_to sensor_path(@sensor)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @sensor.update(sensor_params)
    redirect_to sensor_path(@sensor)
  end

  def destroy
    @sensor.destroy
    redirect_to root_path
  end

  private

  def set_sensor
    @sensor = Sensor.find(params[:id])
    authorize @sensor
  end

  def sensor_params
    params.require(:sensor).permit(
      :item, :item_type, :serial_number, :owner, :register_number, :model,
      :manufacturer, :place_id, :situation, :acquisition_date, :maintenance_date,
      :calibration_date, :observation
      )
  end
end



# Index(['id', 'item'], dtype='object')
# Index(['id', 'item_id', 'item_type'], dtype='object')
# Index(['id', 'place'], dtype='object')
# Index(['id', 'item_id', 'item_type_id', 'serial_number', 'owner',
#        'register_number', 'model', 'manufacturer', 'place_id', 'situation_id',
#        'acquisition_date', 'maintenance_date', 'calibration_date',
#        'observation'],
