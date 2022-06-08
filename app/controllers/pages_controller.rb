class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @pubs = Pub.limit(50)
  end
end
