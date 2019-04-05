json.songs do
  json.array!(@songs) do |song|
    json.title song.title
    json.url song_path(song)
  end
end
