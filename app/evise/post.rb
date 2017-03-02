class Post < ApplicationRecord

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes

  # when post is deleted, comments are destroyed

  belongs_to :category

  validates :title, presence: true
  validates :body, presence: true
  validates :category_id, presence: true

  scope :popular, -> {joins(:likes).group("posts.id").order("count(posts.id) desc")}

end
