module Api
  module V1
# frozen_string_literal: true
class LocationsController < ApplicationController
  before_action :require_location_id
  def create
    @hotel = HotelInfo.find_by(id: params[:hotel_info_id])
    @location = @hotel.locations.new(location_params)
    if @location.save
        msg = { message: 'Location Created', status: 'ok' }
        render json: msg
    else
        render json: {error: "error unable to create"}
    end
  end
  def update
    if @location.update(location_params)
        msg = { message: 'Location Update Sccessfully', status: 'ok' }
        render json: msg
    else
        render json: {error: "error unable to update"}
    end
  end
  def destroy
    if @location.destroy
        msg = { message: 'Location Deleted Sccessfully', status: 'ok' }
        render json: msg
    else
        render json: {error: "error unable to delete"}
    end
  end

  private

  def require_location_id
    @location = Location.find_by(id: params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :latitude, :longitude)
  end
end
end
end
