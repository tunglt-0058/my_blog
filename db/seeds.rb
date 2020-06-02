User.create(name: "Kai", email: "le.tat.tung@framgia.com", password: "tung123")
puts "Generate User"

catgories = Category.create([
                                { name: "Management" },
                                { name: "Startup" },
                                { name: "Freelancer" },
                            ])
puts "Generate categories"

Tag.create!([
  {title: "rails"},
  {title: "ruby"},
  {title: "python"},
  {title: "ui"},
  {title: "ux"},
  {title: "java"},
  {title: "android"},
  {title: "html5"},
  {title: "css"},
  {title: "bootstrap"},
  {title: "jquery"},
  {title: "angular"},
  {title: "react"},
  {title: "database"},
  {title: "mysql"},
  {title: "postgre"},
  {title: "mongodb"},
  {title: "js"},
  {title: "os"},
  {title: "network"},
  {title: "git"},
  {title: "service"},
  {title: "docker"},
  {title: "hardware"}
])
puts "Generate Tags"
