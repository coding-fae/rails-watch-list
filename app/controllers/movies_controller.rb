class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit]

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie, notice: 'Movie was successfully added.'
    else
      render :new
    end
  end

  private

    def set_movie
      @movie = Movie.find(params[:id])
    end


    def movie_params
      params.require(:movie).permit(:title, :overview, :phone_number, :poster_url, :rating)
    end

end
