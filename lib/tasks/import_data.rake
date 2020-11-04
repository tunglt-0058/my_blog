require 'csv'

namespace :import do

  desc "Import words from CSV"
  task words: :environment do
    filename = File.join Rails.root, "words.csv"
    categories_size = Category.count
    count = 1

    CSV.foreach(filename, headers: true).each do |row|
      p row["用語"]
      if row["ステータス"] == "第二レビュー"
        # find category
        category_id = rand(1..categories_size)
        # create user but not exited
        user_name = row["担当者"]
        user = User.find_by(name: user_name)

        if user.nil?
          email = "sunbearsensei+#{count}@sun-asterisk.com"
          User.create!(name: user_name, email: email, password: "Aa@123456")
          count += 1
        end
        user_post_id = User.find_by(name: user_name).id
        #create post
        Post.create!(title: row["用語"], summary: row["概要"], content: row["詳細な説明"], example: row["利用例"], category_id: category_id, user_id: user_post_id)
        # create tag
        tag_title = row["Chapter/カテゴリ"]
        tag = Tag.find_by(title: tag_title)
        Tag.create!(title: tag_title) if tag.nil?

        post_id = Post.find_by(title: row["用語"]).id
        tag_id = Tag.find_by(title: tag_title).id
        PostTag.create!(post_id: post_id, tag_id: tag_id)
      end
    end

    puts "Mission done!!!"
  end
end
