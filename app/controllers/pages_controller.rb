class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @pubs = Pub.limit(20).order(:desc)
  end
end
