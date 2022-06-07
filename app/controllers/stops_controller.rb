class StopsController < ApplicationController
  before_action :find_by_id
  skip_before_action :authenticate_user!, only: %i[create destroy]

  def create
    @pub = Pub.find(params[:id])
    @stop = Stop.new(stop_params)
    @stop.pub = @pub
  end

  def destroy
    @stop.destroy
    redirect_to stops_path, status: :see_other
  end

  private

  def stop_params
    params.require(:stop).permit(:pub_id, :pub_crawl_id)
  end
end
