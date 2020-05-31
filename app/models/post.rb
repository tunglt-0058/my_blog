require 'securerandom'

class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :category, presence: true
  validates :user, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :image, presence: true

  before_save :to_slug

  mount_uploader :image, ImageUploader
  def to_param
    slug
  end

  private
  def to_slug
    self.slug = self.title.parameterize.truncate(80, omission: "") + "-" + SecureRandom.base64(12).to_s
  end
end
