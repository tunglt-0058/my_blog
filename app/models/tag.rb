require 'securerandom'

class Tag < ApplicationRecord
  has_and_belongs_to_many :posts, join_table: :post_tags

  before_save :to_slug
  def to_param
    slug
  end

  private
  def to_slug
    self.slug = self.title.parameterize.truncate(80, omission: "")+ "-" + SecureRandom.uuid
  end
end
