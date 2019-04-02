User.create(name: "Kai", email: "le.tat.tung@framgia.com", password: "tung123")
puts "Generate User"
catgories = Category.create([
                                { name: "Management" },
                                { name: "Startup" },
                                { name: "Freelancer" },
                            ])
puts "Generate categories"
