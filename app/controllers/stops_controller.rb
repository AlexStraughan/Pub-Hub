class StopsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[create destroy]

  before_action :set_pub, only: [:new, :create]

  def new
    @stop = Stop.new
  end

  def create
    @stop = Stop.new(stop_params)
    @stop.pub = @pub
    if @stop.save
      redirect_to pub_crawl_path(@stop.pub_crawl)
    else
      render "pubs/show", status: :unprocessable_entity
    end
    # flash[:notice] = @stop.errors.full_messages.to_sentence unless @stop.save
  end

  private

  def stop_params
    params.require(:stop).permit(:pub_crawl_id)
  end

  def set_pub
    @pub = Pub.find(params[:pub_id])
  end
end
