# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "csv"

Game.destroy_all
Employee.destroy_all
Platform.destroy_all
Genre.destroy_all
GameGenre.destroy_all

video_game_csv = File.read(Rails.root.join("db/games.csv"))
games = CSV.parse(video_game_csv, headers: true, encoding: "utf-8")

platform_csv = File.read(Rails.root.join("db/platforms.csv"))
platforms = CSV.parse(platform_csv, headers: true, encoding: "utf-8")

platforms.each do |p|
  p = Platform.create(
    name: p["Name"],
    release_date: p["ReleaseDate"]
  )
end

15.times do
  employee = Employee.new
  employee.name = Faker::Name.name
  employee.save
end

id = Employee.first()
id = id.id

games.each do |game|
  platform = Platform.find_or_create_by(name: game["Platform"])

  if platform.valid?
    employees = Employee.find(rand(id..(id+14)))
    v = platform.games.create(
      name: game["Name"],
      release_year: game["ReleaseYear"],
      description: game["Overview"],
      publisher: game["Publisher"],
      employee_id: employees.id
    )
    unless v.valid?
      puts "Could not create game: #{game['Name']}"
      puts v.errors.messages
      next
    end

    genres = game["Genres"].split(";")

    genres.each do |genre|
      g = Genre.find_or_create_by(name: genre)

      unless g.valid?
        puts "Invalid genre: #{genre} for game: #{v.name}"
        next
      end

      GameGenre.create(game: v, genre: g)
    end

  else
    puts "Could not create game platform: #{game['platform']}"
    puts platform.errors.messages
  end
end
