class Review < ActiveRecord::Base
  validates :author, :presence => true
  validates :text, :presence => true
  belongs_to :movie

end
