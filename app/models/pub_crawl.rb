class PubCrawl < ApplicationRecord
  has_many :stops, dependent: :destroy
  has_many :pubs, through: :stops, dependent: :destroy
end
