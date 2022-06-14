class PubCrawlsController < ApplicationController
  before_action :find_by_id, only: [:show]
  skip_before_action :authenticate_user!, only: %i[index show create]

  def index
    @pub_crawls = PubCrawl.all
  end

  def show
    @stop = Stop.new
  end

  # def new
  #   # @pub_crawl = PubCrawl.find(params[:id])
  #   @pub_crawl = PubCrawl.new
  # end

  # def create
  #   @pub_crawl = PubCrawl.new(pub_crawl_params)
  #   if @pub_crawl.save
  #     redirect_to pub_crawl_path(@pub_crawl)
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @pub_crawl.destroy
  #   redirect_to pub_crawls_path, status: :see_other
  # end

  private

  def find_by_id
    @pub_crawl = PubCrawl.find(params[:id])
  end

  def pub_crawl_params
    params.require(:pub_crawl).permit(:name, :time)
  end
end
