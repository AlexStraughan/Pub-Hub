class PubCrawl < ApplicationRecord
  has_many :stops, dependent: :destroy
  has_many :pubs, through: :stops, dependent: :destroy

  validates :name, uniqueness: true, presence: true

end
