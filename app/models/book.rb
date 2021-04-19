class Book < ApplicationRecord

  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :book_image
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  validates :name, presence: true
  validates :body, presence: true

end
