module ApplicationHelper
  def full_title title
    title.empty? ? t("app_title") : title + " | " + t("app_title")
  end
  def post_image post
    if post
      @image = post.image_url
      if post && @image
        @image
      else
        "post-sample-image.jpg"
      end
    end
  end
end
