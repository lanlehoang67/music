# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_03_31_142408) do

  create_table "albums", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "artist_id"
    t.string "name"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_albums_on_artist_id"
  end

  create_table "artists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "date_of_birth"
    t.integer "begin_year"
    t.datetime "end_date"
    t.string "website"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "song_id"
    t.index ["song_id"], name: "index_comments_on_song_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "genres", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lyrics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.float "start"
    t.text "text", limit: 4294967295
    t.float "end"
    t.bigint "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_lyrics_on_song_id"
  end

  create_table "notifications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_favorite_id"
    t.string "title"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_favorite_id"], name: "index_notifications_on_user_favorite_id"
  end

  create_table "song_genres", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "song_id"
    t.bigint "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_song_genres_on_genre_id"
    t.index ["song_id"], name: "index_song_genres_on_song_id"
  end

  create_table "songs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "artist_id"
    t.string "url"
    t.string "title"
    t.string "content"
    t.string "length"
    t.integer "views"
    t.bigint "album_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "picture"
    t.index ["album_id"], name: "index_songs_on_album_id"
    t.index ["artist_id"], name: "index_songs_on_artist_id"
    t.index ["user_id"], name: "index_songs_on_user_id"
  end

  create_table "user_favorites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "favorite_type_id", null: false
    t.bigint "favorite_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_favorites_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.boolean "gender"
    t.date "date_of_birth"
    t.string "picture"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "albums", "artists"
  add_foreign_key "comments", "songs"
  add_foreign_key "comments", "users"
  add_foreign_key "lyrics", "songs"
  add_foreign_key "notifications", "user_favorites"
  add_foreign_key "song_genres", "genres"
  add_foreign_key "song_genres", "songs"
  add_foreign_key "songs", "albums"
  add_foreign_key "songs", "artists"
  add_foreign_key "songs", "users"
  add_foreign_key "user_favorites", "users"
end
