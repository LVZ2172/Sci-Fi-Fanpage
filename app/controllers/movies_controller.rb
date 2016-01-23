class MoviesController < ApplicationController

  def index
    @movie = Movie.new
    @movies = Movie.all.paginate(page: params[:page], per_page: 2)
    if params[:sort_by] == "Alphabetically"
      @movies = Movie.all.sort_by{|movie| [movie.name]}
    elsif params[:sort_by] == "Date"
      @movies = Movie.all.sort_by{|movie| [movie.created_at]}.reverse
    end
  end

  def new
    @movie = Movie.new
  end

  def show
    @movie = Movie.find(params[:id])
    @review = @movie.reviews.new
    @reviews = Review.all
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movies_params)
      flash[:notice] = "Successfully updated"

      respond_to do |format|
        format.html { redirect_to movies_path, notice: "Successfully updated"}
        format.js
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Successfully deleted"

  respond_to do |format|
    format.html { redirect_to movies_path, notice: "Successfully deleted"}
    format.js
  end
end

  def create
    @movie = Movie.create(movies_params)
    @movie.save
      flash[:notice] = "Successfully added"
    respond_to do |format|
      format.html { redirect_to movies_path, notice: "Successfully added"}
      format.js
    end
  end

  private

  def movies_params
    params.require(:movie).permit(:name, :information, :image)
  end
end
