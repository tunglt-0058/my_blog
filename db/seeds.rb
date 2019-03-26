catgories = Category.create([
                                { name: "Management" },
                                { name: "Startup" },
                                { name: "Freelancer" },
                            ])
puts "Generate categories"

50.times do |i| Post.create(title: "Man must explore, and this is exploration at its greatest",
                            content: BetterLorem.p(5, false, false),
                            image_url: "http://propeller.in/assets/images/profile-pic.png")
  catgories.each do |category|
    PostCategory.create(post_id: (i+1), category_id: category.id)
  end
end
puts "Generate posts"
puts "Generate Post Cargories"
