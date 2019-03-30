User.create(name: "Kai", email: "le.tat.tung@framgia.com", password: "tung123")
puts "Generate User"
catgories = Category.create([
                                { name: "Management" },
                                { name: "Startup" },
                                { name: "Freelancer" },
                            ])
puts "Generate categories"
catgories.each do |category|
  20.times do |i| Post.create(title: "Man must explore, and this is exploration at its greatest",
                              content: BetterLorem.p(5, false, false),
                              image_url: Rails.root.join("app/assets/images/post-sample-image.jpg").open, category_id: category.id,
                              user_id: 1)

  end
end
puts "Generate posts"
