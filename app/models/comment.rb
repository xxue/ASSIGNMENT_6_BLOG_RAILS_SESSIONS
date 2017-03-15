class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :body, presence: true

  scope :latest_first, -> {order("created_at DESC")}
end
