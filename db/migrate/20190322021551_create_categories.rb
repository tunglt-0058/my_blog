class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :avatar_url
      t.string :slug

      t.timestamps
    end
  end
end
