class SensorsController < ApplicationController

  before_action :set_sensor, only: [:show, :edit, :update, :destroy]

  def index
    if params[:commit].present?
      @price = params[:item]
      @commit = params[:subitem]
      @skill = params[:situation]
      @experience = params[:place]
      query = ""
      if params[:item] != ""
        query += "item = #{params[:price].to_i} AND "
      end
      if params[:experience] != ""
        query += "experience >= #{params[:experience].to_i} AND "
      end
      if params[:skill] != "Selecione uma habilidade"
        query += "skill = '#{params[:skill]}' AND "
      end
      if query != ""
        query = query[0..-5]
        @sensors = policy_scope(Sensor).where(query).order(order_param)
      else
        @sensors = policy_scope(Sensor).order(order_param)
      end
    else
      @sensors = policy_scope(Sensor).order(order_param)
    end
    @sensors = policy_scope(Sensor)
    @situations = Situation.all
    @places = Place.all
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
    params.require(:sensor).permit(:experience, :skill, :price)
  end
end


# host_postgre = 'remobs-equip.postgres.uhserver.com'
# username_postgre = 'equip_remobs'
# password_postgre = 'Marinha1@'
# database_postgre = 'remobs_equip'
