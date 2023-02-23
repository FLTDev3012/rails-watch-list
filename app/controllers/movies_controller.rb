class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def top
    @movies = Movie.where("rating > ?", 6.9)
  end
end
