class Post < ActiveRecord::Base
  validates :title, presence: :true

  belongs_to :user
  belongs_to :region

  def owned_by?(user)
    self.user == user
  end
end
