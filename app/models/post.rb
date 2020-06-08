require "securerandom"

class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags
  has_and_belongs_to_many :tags, join_table: :post_tags

  has_many :bookmarks
  has_many :bookmark_users, source: :bookmark_users, through: :bookmarks

  accepts_nested_attributes_for :tags
  accepts_nested_attributes_for :post_tags

  validates :category, presence: true
  validates :user, presence: true
  validates :title, presence: true
  validates :summary, presence: true
  validates :content, presence: true
  validates :image, presence: true

  before_save :to_slug

  mount_uploader :image, ImageUploader
  scope :load_recommend_posts, -> (post_id){where.not(id: post_id)
    .order id: :desc}

  def recommend_posts
    Post.load_recommend_posts self.id
  end

  class << self
    def search data
      data = data.downcase
      Post.where "lower(title) LIKE ?", "%#{data}%"
    end
  end

  def to_param
    slug
  end

  private
  def to_slug
    self.slug = self.title.romaji.parameterize.truncate(80, omission: "") + "-" + SecureRandom.uuid
  end
end
