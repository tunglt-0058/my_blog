class User < ApplicationRecord
  has_many :bookmarks
  has_many :bookmark_posts, source: :bookmark_posts, through: :bookmarks

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true, length: {maximum: 255},
            format: {with: Devise.email_regexp}, uniqueness: {case_sensitive: false}
  validates :password, presence: true,
            length: {within: Devise.password_length}, allow_nil: true
  validates :name, presence: true, length: {maximum: 50}

  has_many :posts, dependent: :destroy

  def add_bookmark(post)
    bookmarks.find_or_create_by(post_id: post.id)
  end

  def remove_bookmark(post)
    bookmark = bookmarks.find_by(post_id: post.id)
    bookmark.destroy if bookmark
  end
end
