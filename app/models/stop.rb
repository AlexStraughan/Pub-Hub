class Stop < ApplicationRecord
  belongs_to :pub
  belongs_to :pub_crawl
end
