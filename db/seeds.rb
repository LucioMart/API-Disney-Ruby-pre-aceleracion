# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    anio = (1920..2021)
    peso = (1.40..1.90)
    #7.times do |x|
     #   Genre.create(name: "Genero #{x}", image_url: "http://lorempixel.com/320/460/")
    #end
    100.times do |i|
        genre = Genre.create(name: "Genero #{i}", image_url: "http://lorempixel.com/320/460/")
        character = Character.create(name: "Personaje Disney #{i}", year: "#{rand(32)}-#{rand(13)}-#{rand(anio)}", weigh: rand(peso), story: "Historia #{i}", picture: "http://lorempixel.com/320/460/")
        Movie.create(title: "Pelicula #{i}", qualification: "#{rand(5)}", picture: "http://lorempixel.com/320/460/", character_ids: [character.id])
    end