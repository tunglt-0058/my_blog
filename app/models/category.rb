require 'securerandom'

class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  before_save :to_slug
  def to_param
    slug
  end

  private
  def to_slug
    self.slug = self.name.parameterize.truncate(80, omission: "")+ "-" + SecureRandom.base64(12).to_s
  end
end
