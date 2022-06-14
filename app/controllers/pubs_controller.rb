class PubsController < ApplicationController
  before_action :find_by_id, only: [:show]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @pubs = Pub.all
    @markers = @pubs.geocoded.map do |pub|
      {
        lat: pub.latitude,
        lng: pub.longitude,
        info_window: render_to_string(partial: "info_window", locals: { pub: pub }),
        image_url: helpers.asset_url("beer.png")
      }
    end
  end

  def show
    @pub = Pub.find(params[:id])
    @stop = Stop.new
  end

  def confirmation
    @pub = Pub.find(params[:id])
  end

  private

  def find_by_id
    @pub = Pub.find(params[:id])
  end

  def pub_params
    params.require(:pub).permit(:name, :address, :description, :latitude, :longitude)
  end
end
