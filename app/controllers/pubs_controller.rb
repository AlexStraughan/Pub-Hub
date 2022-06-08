class PubsController < ApplicationController
  before_action :find_by_id, only: [:show]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @pubs = Pub.all

    @markers = @pubs.geocoded.map do |pub|
      {
        lat: pub.latitude,
        lng: pub.longitude
      }
    end
  end

  def show
  end

  private

  def find_by_id
    @pub = Pub.find(params[:id])
  end

  def pub_params
    params.require(:pub).permit(:name, :address, :description)
  end
end
