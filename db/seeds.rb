require 'json'
require 'open-uri'

puts 'cleaning database...'
Movie.destroy_all


api_url = URI.open('http://tmdb.lewagon.com/movie/top_rated').read
response = JSON.parse(api_url)
results = response['results']
poster = 'https://image.tmdb.org/t/p/w500'

results.each do |r|
  movie = Movie.create(title: r['title'], overview: r['overview'], poster_url: poster + r['poster_path'], rating: r['vote_average'])
  puts "#{movie.title} has been created!"
end
