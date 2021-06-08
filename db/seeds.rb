# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do |i|
    movie = Movie.create(title: "Movie #{i}", gender: i,qualification: i,picture: "http://lorempixel.com/320/460/")
    Character.create( name: "Character #{i}", year: "#{i}-#{i}-1990",weigh: i, story: "Story #{i}", picture: "http://lorempixel.com/320/460/", movie_ids: [movie.id])
end