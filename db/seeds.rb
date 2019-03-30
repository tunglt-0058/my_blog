catgories = Category.create([
                                { name: "Management" },
                                { name: "Startup" },
                                { name: "Freelancer" },
                            ])
puts "Generate categories"
catgories.each do |category|
  50.times do |i| Post.create(title: "Man must explore, and this is exploration at its greatest",
                              content: BetterLorem.p(5, false, false),
                              image_url: "http://propeller.in/assets/images/profile-pic.png", category_id: category.id)

  end
end
puts "Generate posts"
