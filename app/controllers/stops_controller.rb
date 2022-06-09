class StopsController < ApplicationController
  before_action :find_by_id
  skip_before_action :authenticate_user!, only: %i[create destroy]

  before_action :set_stop, only: :destroy
  before_action :set_pub_crawl, only: [:new, :create]

  def new
    @stop = Stop.new
  end

  def create
    @stop = Stop.new(stop_params)
    @stop.pub_crawl = @pub_crawl
    flash[:notice] = @stop.errors.full_messages.to_sentence unless @stop.save
    redirect_to pub_crawl_path(@pub_crawl)
  end

  def destroy
    @stop.destroy
    redirect_to pub_crawl_path(@stop.pub_crawl), status: :see_other
  end

  private

  def stop_params
    params.require(:stop).permit(:pub_id, :pub_crawl_id)
  end

  def set_stop
    @stop = Stop.find(params[:id])
  end

  def set_pub_crawl
    @pub_crawl = Pub_crawl.find(params[:pub_crawl_id])
  end
end
