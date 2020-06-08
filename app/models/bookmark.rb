class Bookmark < ApplicationRecord
  validates :user_id, presence: true
  validates :post_id, presence: true

  belongs_to :bookmark_users, class_name: "User", foreign_key: "user_id"
  belongs_to :bookmark_posts, class_name: "Post", foreign_key: "post_id"
end
