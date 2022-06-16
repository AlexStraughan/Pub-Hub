require 'open-uri'
require 'json'
require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   pubs = Movie.create!([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create!(name: "Luke", pub: pubs.first)
PubCrawl.destroy_all

Review.destroy_all

Pub.destroy_all

User.destroy_all

User.create(
  email: "cal@email.com",
  password: "123456",
)

10.times do
  User.create(
    email: Faker::Internet.email,
    password: "123456",
  )
end








london_pubs = 'https://overpass-api.de/api/interpreter?data=%2F*%0AThis%20has%20been%20generated%20by%20the%20overpass-turbo%20wizard.%0AThe%20original%20search%20was%3A%0A%E2%80%9Cpub%20in%20london%E2%80%9D%0A*%2F%0A%5Bout%3Ajson%5D%5Btimeout%3A30%5D%3B%0A%2F%2F%20fetch%20area%20%E2%80%9Clondon%E2%80%9D%20to%20search%20in%0Aarea%28id%3A3600065606%29-%3E.searchArea%3B%0A%2F%2F%20gather%20results%0A%28%0A%20%20%2F%2F%20query%20part%20for%3A%20%E2%80%9Cpub%E2%80%9D%0A%20%20node%5B%22amenity%22%3D%22pub%22%5D%28area.searchArea%29%3B%0A%20%20way%5B%22amenity%22%3D%22pub%22%5D%28area.searchArea%29%3B%0A%20%20relation%5B%22amenity%22%3D%22pub%22%5D%28area.searchArea%29%3B%0A%29%3B%0A%2F%2F%20print%20results%0Aout%20body%3B%0A%3E%3B%0Aout%20skel%20qt%3B'

pubsArray = JSON.parse(URI.open(london_pubs).read)['elements']
  # 10.times do
    # p pubs.first

    # pubsArray.first(10).each do |pub|

    #   # p pub['tags']['addr:postcode']
    #   # p pub['lat']
    #   # p pub['lon']
    # end


  pubsArray.first(3000).each do |pub|

    p = Pub.create!(
    name: pub['tags']['name'],
    address: pub['tags']['addr:postcode'],
    description: pub['tags']['description'],
    latitude: pub['lat'],
    longitude: pub['lon'],
    brand: pub['tags']['brand'],
    wheelchair: pub['tags']['wheelchair'],
    smoking: pub['tags']['smoking'],
    )
    4.times do
    Review.create!(
    rating: rand(1..5),
    comment: Faker::Restaurant.review,
    pub_id: p.id,
    user: User.all.sample
    )
    end
  end

PubCrawl.create!(
  name: "the best crawl",
  time: "tuesday",
)

PubCrawl.create!(
  name: "the second best crawl",
  time: "wednesday",
)

PubCrawl.create!(
  name: "not the best crawl",
  time: "thursday",
)



  # Review.create! for each pub create! review
  # create! rating rand(4)
  # create! comment - Faker::Restaurant.review
  #

#   url = "http://tmdb.lewagon.com/movie/top_rated"
# 10.times do |i|
#   puts "Importing movies from page #{i + 1}"
#   movies = JSON.parse(URI.open("#{url}?page=#{i + 1}").read)['results']
#   movies.each do |movie|
#     puts "Creating #{movie['title']}"
#     base_poster_url = "https://image.tmdb.org/t/p/original"
#     Movie.create!(
#       title: movie['title'],
#       overview: movie['overview'],
#       poster_url: "#{base_poster_url}#{movie['backdrop_path']}",
#       rating: movie['vote_average']
#     )
#   end
# end
