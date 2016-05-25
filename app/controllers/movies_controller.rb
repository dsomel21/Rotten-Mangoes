class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # GET /movies
  def index
    if params.include[:name] #|| params.has_key?[:director] 
      Movie.search(params)
    else 
      @movies = Movie.all
    end
    # Title (text)
    # Director (text)
    # Duration
  end

  # GET /movies/1
  def show
    @movie = Movie.find(params[:id])
    # binding.pry
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
      redirect_to movies_path, notice: "Welcome aboard, #{current_user.firstname}!"
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

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    puts '**********'
    puts params.inspect
    puts '**********'
    params.require(:movie).permit(
      :name, :release_date, :director, :runtime_in_minutes, :description, :image, :remove_image
      )

  end

end
