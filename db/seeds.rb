# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |n|
  name = Faker::Artist.name
  date = Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today)
  a = Artist.create!(name: name, date_of_birth: date)
  Album.create(artist_id: a.id, name: Faker::Name.name)
end
genres = ['pop','dance','romance']
genres.each { |genre| Genre.create(title: genre) }
s =Song.create(artist_id: 1,title: 'em cua ngay hom qua',genre_id: 1,album_id: 1)
# artists = Artist.all
# artists.each_with_index {|artist,index| Song.create(artist_id: artist.id, title: Faker::Commerce.department, genre_id: index, album_id: index )}
Lyric.create(start: 0,text: Faker::Lorem.sentence,end: 5,song_id: s.id)
Lyric.create(start: 15,text: Faker::Lorem.sentence,end: 20,song_id: s.id)
