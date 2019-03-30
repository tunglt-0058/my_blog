class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :slug
      t.string :image_url
      t.integer :category_id

      t.timestamps
    end
  end
end
