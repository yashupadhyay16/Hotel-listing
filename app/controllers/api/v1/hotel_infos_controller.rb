module Api
  module V1
    class HotelInfosController < ApplicationController
    before_action :require_id, only: %i[show destroy update]
    def create
      @hotel = HotelInfo.new(hotel_params)
      if @hotel.save
          msg = { message: 'Hotel Info Created', status: 'ok' }
          render json: msg
      else
          render json: {error: "error while submitting form"}
      end
    end
    def index
      @hotels = HotelInfo.all.select('id , name, image_url')
        msg = { result: { hotels: @hotels.as_json, status: 'ok' } }
        render json: msg
    end
    def show
      if @hotel
          msg = { result: @hotel.as_json(include: :locations), status: 'ok' }
          render json: msg
      else
          render json: {error: "error unable to find data"}
      end
    end
    def update
      if @hotel.update(hotel_params)
          msg = { result: @hotel.as_json(include: :locations), status: 'ok' }
          render json: msg
      else
          render json: {error: "error unable to update"}
      end
    end
    def destroy
      if @hotel.destroy
          msg = { message: 'Location Deleted Sccessfully', status: 'ok' }
          render json: msg
      else
          render json: {error: "error unable to delete"}
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
