class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # GET /movies
  def index
    @movies = Movie.all
  end

  # GET /movies/1
  def show
    @movie = Movie.find(params[:id])
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
    @movie = Movie.find(params[:id])
  end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path, notice: "Welcome aboard, #{@user.firstname}!"
    else
      render :new
    end
  end

  # PATCH/PUT /movies/1
  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movies_path
    else
      render :edit
    end
  end

  # DELETE /movies/1
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end


  protected

  def movie_params
    params.require(:movie).permit(
      :name, :release_date, :director, :runtime_in_minutes, :poster_image_url, :description
      )
  end

end
