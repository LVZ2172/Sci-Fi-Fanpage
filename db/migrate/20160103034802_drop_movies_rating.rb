class DropMoviesRating < ActiveRecord::Migration
  def change
    remove_column :movies, :rating
  end
end
