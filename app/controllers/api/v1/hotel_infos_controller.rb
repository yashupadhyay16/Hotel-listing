module Api
  module V1
    class HotelInfosController < ApplicationController
    before_action :require_id, only: %i[show destroy update]
    def create
        @hotel = HotelInfo.new(hotel_params)
        if @hotel.save
            respond_to do |format|
                msg = { message: 'Hotel Info Created', status: 'ok' }
                format.json { render json: msg }
            end
        end
    end
  def index
    @hotels = HotelInfo.all.select('id , name, image_url')
    respond_to do |format|
      msg = { result: { hotels: @hotels.as_json, status: 'ok' } }
      format.json { render json: msg }
    end
  end
  def show
    if @hotel
      respond_to do |format|
        msg = { result: @hotel.as_json(include: :locations), status: 'ok' }
        format.json { render json: msg }
      end
    end
  end
  def update
    if @hotel.update(hotel_params)
      respond_to do |format|
        msg = { result: @hotel.as_json(include: :locations), status: 'ok' }
        format.json { render json: msg }
      end
    end
  end
  def destroy
    if @hotel.destroy
      respond_to do |format|
        msg = { message: 'Location Deleted Sccessfully', status: 'ok' }
        format.json { render json: msg }
      end
    end
  end
  private
  def require_id
    @hotel = HotelInfo.find_by(id: params[:id])
  end
  def hotel_params
    params.require(:hotel).permit(:name, :price, :address, :image_url)
  end
end
end
end
