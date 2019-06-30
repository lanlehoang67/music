class GenresController < ApplicationController
  before_action :load_genres, only: :index
  def index
  end

  def show
  end

  private 

  def load_genres
  	@genres = Genre.all
  end
end
