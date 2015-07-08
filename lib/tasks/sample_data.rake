namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Stevie Vines",
                 email: "stevievines@gmail.com",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all.limit(6)
    dark_knight = {
      tmdb_id: 155,
      imdb_id: "tt0468569",
      release_date: Date.parse("2008-07-18"),
      title: "The Dark Knight",
      poster_path: "/1hRoyzDtpgMU7Dz4JF22RANzQO7.jpg"
    }
    inception = {
      tmdb_id: 27205,
      imdb_id: "tt1375666",
      release_date: Date.parse("2010-07-16"),
      title: "Inception",
      poster_path: "/tAXARVreJnWfoANIHASmgYk4SB0.jpg",
    }
    users.each do |user|
      top_list = user.lists.where(title: 'Top Ten').first_or_create
      watchlist = user.lists.where(title: 'To Watch').first_or_create
      i = Movie.where(inception).first_or_create
      dk = Movie.where(dark_knight).first_or_create
      top_list.list_movies.where(movie_id: i.id).first_or_create
      watchlist.list_movies.where(movie_id: dk.id).first_or_create
    end
  end
end

