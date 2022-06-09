class Stop < ApplicationRecord
  belongs_to :pub
  belongs_to :pub_crawl

  validates :pub_id, uniqueness: { scope: :pub_crawl_id, message: "is already in the pub crawl" }

end
