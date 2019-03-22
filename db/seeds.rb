catgories = Category.create([
                                { name: "Project management" },
                                { name: "Startup" },
                                { name: "Freelancer"},
                                { name: "Agile"}
                            ])
puts "Generate categories"

posts = Post.create([
                        {title: "Man must explore, and this is exploration at its greatest",
                         content: "Problems look mighty small from 150 miles up"},
                        {title: "I believe every human has a finite number of heartbeats",
                         content: "I don't intend to waste any of mine."},
                        {title: "Science has not yet mastered prophecy",
                         content: "We predict too much for the next year and yet far too little for the next ten."},
                        {title: "Failure is not an option",
                         content: "Many say exploration is part of our destiny, but it’s actually our duty to future generations."}
                    ])
puts "Generate posts"

posts.each do |post|
  catgories.each do |category|
    PostCategory.create(post_id: post.id, category_id: category.id)
  end
end
puts "Generate Post Cargories"
