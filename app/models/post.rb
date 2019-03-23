class Post < ApplicationRecord
  has_many :post_categories
  has_many :categories, through: :post_categories, dependent: :destroy
  before_save :to_slug
  def to_param
    slug
  end

  private
  def to_slug
    self.slug = self.title.parameterize.truncate(80, omission: "")
  end
end
