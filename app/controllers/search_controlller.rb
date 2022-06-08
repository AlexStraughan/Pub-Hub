class SearchController < ApplicationController
  def index
      @results = GoogleCustomSearchApi.search(@pub.name), {"searchType" => "image"})
	end
  end
end
