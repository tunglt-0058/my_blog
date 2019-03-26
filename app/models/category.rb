class Category < ApplicationRecord
  has_many :post_categories
  has_many :posts, through: :post_categories, dependent: :destroy
  before_save :to_slug
  def to_param
    slug
  end

  private
  def to_slug
    self.slug = self.name.parameterize.truncate(80, omission: "")
  end
end
