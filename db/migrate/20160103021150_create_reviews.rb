class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.column :author, :string
      t.column :text, :string
      t.column :rating, :integer
      t.column :movie_id, :integer
      t.timestamps
    end
  end
end
