class Post < ApplicationRecord
  belongs_to :category

  validates :category, presence: true
  validates :title, presence: true
  validates :content, presence: true
  before_save :to_slug
  def to_param
    slug
  end

  private
  def to_slug
    self.slug = self.title.parameterize.truncate(80, omission: "")
  end
end
