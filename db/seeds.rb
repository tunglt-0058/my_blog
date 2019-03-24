catgories = Category.create([
                                { name: "Management", avatar_url: "https://previews.123rf.com/images/wad/wad1510/wad151000139/46545629-human-resources-management-icon-business-concept-flat-design-isolated-illustration-.jpg" },
                                { name: "Startup", avatar_url: "https://autoattend.com/assets/startup.png" },
                                { name: "Freelancer", avatar_url: "https://cdn1.iconfinder.com/data/icons/data-science-1-1/512/20-512.png" },
                                { name: "Agile", avatar_url: "https://letznav.com/wp-content/uploads/2017/11/AGILE-icon-350x350.png"}
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
