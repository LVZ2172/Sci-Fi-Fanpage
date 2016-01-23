class Movie < ActiveRecord::Base
  validates :name, :presence => true
  validates :information, :presence => true
  # validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" },
  default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  has_many :reviews


  def rating_average
    reviews = self.reviews.where(self.id).count
    if (reviews != 0)
      rating = self.reviews.sum(:rating) / reviews
      return rating.round(2)
    end
   end

   def review_number
     self.reviews.where(self.id).count
   end
end
