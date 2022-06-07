class PubCrawlsController < ApplicationController
  before_action :find_by_id, only: [:show]
  skip_before_action :authenticate_user!, only: %i[index show create]

  def index
    @pub_crawls = Pub_crawl.all
  end

  def show
    @pub_crawl = Pub_crawl.find(params[:id])
  end

  def new
    @pub_crawl = Pub_crawl.find(params[:id])
    @pub_crawl = Pub_crawl.new
  end

  def create
    @stop = Stop.find(params[:id])
    @pub_crawl = Pub_crawl.new(pub_crawl_params)
    @pub_crawl.stop = @stop
    @pub_crawl.user = current_user
    if @pub_crawl.save
      redirect_to pub_crawl_path(@pub_crawl), notice: 'Pub-Crawl was successfully brewed.'
    else
      render 'pub_crawls/show', status: :unprocessable_entity
    end
  end

  private

  def find_by_id
    @pub_crawl = Pub_crawl.find(params[:id])
  end

  def pub_crawl_params
    params.require(:pub_crawl).permit(:name, :time)
  end
end
