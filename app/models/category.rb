class Category < ActiveRecord::Base
  validates :name, presence: :true

  has_many :category_relationships, dependent: :destroy
  has_many :posts, through: :category_relationships
end
