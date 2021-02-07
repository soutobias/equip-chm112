class SensorsController < ApplicationController

  before_action :set_sensor, only: [:show, :edit, :update, :destroy, :download]

  def index
    if params[:commit].present?
      @commit = params[:commit]
      @situation_id = params[:situation]
      @place_id = params[:place]
      @item_id = params[:item]
      @item_type_id = params[:item_type]
      @acquisition_date = params[:acquisition_date]
      @calibration_date = params[:calibration_date]
      @maintenance_date = params[:maintenance_date]
      @owner = params[:owner]
      @register_number = params[:register_number]
      @manufacturer = params[:manufacturer]
      @model = params[:model]
      query = ""
      if @situation_id != ""
        query += "situation_id = #{@situation_id.to_i} AND "
      end
      if @place_id != ""
        query += "place_id = #{@place_id.to_i} AND "
      end
      if @item_id != ""
        query += "item_id = '#{@item_id}' AND "
      end
      if @item_type_id != ""
        query += "item_type_id = '#{@item_type_id}' AND "
      end
      if !["0",""].include? @owner
        query += "owner = '#{@owner}' AND "
      end
      if !["0",""].include? @manufacturer
        query += "manufacturer = '#{@manufacturer}' AND "
      end
      if !["0",""].include? @model
        query += "model = '#{@model}' AND "
      end
      if !["0",""].include? @register_number
        query += "register_number = '#{@register_number}' AND "
      end
      if @acquisition_date != ""
        query += "acquisition_date >= '#{@acquisition_date}' AND "
      end
      if @calibration_date != ""
        query += "calibration_date >= '#{@calibration_date}' AND "
      end
      if @maintenance_date != ""
        query += "maintenance_date >= '#{@maintenance_date}' AND "
      end
      if query != ""
        query = query[0..-5]
        @x = 1
        if params[:sort].present?
          @sensors = policy_scope(Sensor).includes(:situation,
            :place, :item, :item_type).where(query).order(params[:sort])
        else
          @sensors = policy_scope(Sensor).includes(:situation, :place, :item,
            :item_type).where(query).order(:id)
        end
      else
        @sensors = policy_scope(Sensor)
        @x = 0
      end
    else
      @sensors = policy_scope(Sensor)
      @x = 0
    end
    @situations = Situation.all
    @places = Place.all
    @items = Item.all
    @item_types = ItemType.all
  end

  def new
    @sensor = Sensor.new
    @situations = Situation.all
    @places = Place.all
    @items = Item.all
    @item_types = ItemType.all
    authorize @sensor
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
    @situations = Situation.all
    @places = Place.all
    @items = Item.all
    @item_types = ItemType.all
  end

  def update
    @sensor.update(sensor_params)
    redirect_to sensor_path(@sensor)
  end

  def destroy
    @sensor.destroy
    redirect_to root_path
  end

  def download
    file_id = params[:file_id].to_i
    raise
    file = Cloudinary::Downloader.download(@sensor.files[file_id].key, flags: :attachment)
    pdf = File.new("Arquivo#{file_id}", "wb")
    pdf.write(file)
    pdf.close
    redirect_to sensor_path(@sensor)
  end

  private

  def set_sensor
    @sensor = Sensor.find(params[:id])
    authorize @sensor
  end

  def sensor_params

    params.require(:sensor).permit(
      :item_id, :item_type_id, :serial_number, :owner, :register_number, :model,
      :manufacturer, :place_id, :situation_id, :acquisition_date, :maintenance_date,
      :calibration_date, :observation, :photo, files: []
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

            # <%= link_to "Arquivo#{idx + 1}", sensor_download_path(@sensor, file_id: "#{idx}", id: "#{@sensor.id}"), method: :post %>
