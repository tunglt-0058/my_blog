class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :category, presence: true
  validates :user, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :image_url, presence: true

  before_save :to_slug

  mount_uploader :image_url, ImageUploader
  def to_param
    slug
  end

  private
  def to_slug
    self.slug = self.title.parameterize.truncate(80, omission: "")
  end
end
