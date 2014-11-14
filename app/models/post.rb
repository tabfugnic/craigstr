class Post < ActiveRecord::Base
  validates :name, presence: :true

  belongs_to :user
  belongs_to :region

  has_many :category_relationships, dependent: :destroy
  has_many :categories, through: :category_relationships

  def owned_by?(user)
    self.user == user
  end
end
