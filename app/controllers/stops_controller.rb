class StopsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[create destroy]

  before_action :set_pub, only: [:new, :create]

  def new
    @stop = Stop.new
  end

  def create
    @stop = Stop.new(stop_params)
    @stop.pub = @pub
    # flash[:notice] = @stop.errors.full_messages.to_sentence unless @stop.save
    redirect_to pub_path(@pub)
  end

  private

  def stop_params
    params.require(:stop).permit(:pub_crawl_id)
  end

  def set_pub
    @pub = Pub.find(params[:pub_id])
  end
end
