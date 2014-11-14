class Post < ActiveRecord::Base
  validates :title, presence: :true

  belongs_to :region
  belongs_to :user

  def owned_by?(user)
    self.user == user
  end

  def mark_as_spam!
    self.spam = true
    self.save
  end
end
