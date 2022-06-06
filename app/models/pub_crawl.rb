class PubCrawl < ApplicationRecord
  has_many :stops
  has_many :pubs, through: :stops
end
