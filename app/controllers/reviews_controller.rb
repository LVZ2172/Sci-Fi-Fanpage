class ReviewsController < ApplicationController

  def show
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.find(params[:id])
  end

  def new
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @reviews = @movie.reviews
    @review = @movie.reviews.new(reviews_params)
    @review.save
      flash[:notice] = "Successfully added"

      respond_to do |format|
        format.html { redirect_to movie_path(@movie), notice: "Successfully added"}
        format.js
    end
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @reviews = Review.find(params[:id])
    @reviews.destroy
      flash[:notice] = "Successfully deleted"

    respond_to do |format|
      format.html { redirect_to movies_path(@movie), notice: "Successfully deleted"}
      format.js
    end
  end

  private

  def reviews_params
    params.require(:review).permit(:author, :text, :rating)
  end

end
