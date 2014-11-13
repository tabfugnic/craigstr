class Category < ActiveRecord::Base
  validates :name, presence: :true

  has_many :category_relationships, dependent: :destroy
  has_many :posts, through: :category_relationships

  def ordered_posts(region)
    self.posts.where(region_id: region.id).order(created_at: :desc)
  end
end
