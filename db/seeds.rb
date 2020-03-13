# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Post.destroy_all
Like.destroy_all
Comment.destroy_all
##TEST USERS
emotions = ["happy","sad","hungry","excited","depressed","cool","chill","relaxed"]

us1 = User.create(username: "Danny", password:'1234', mood: "mad")
us2= User.create(username: "Eli", password:'1111', mood: "happy")
us3 = User.create(username: "Jack", password:'2222', mood: "curious")
us4 = User.create(username: Faker::Name.name, password:'3333', mood: "excited")
us5 = User.create(username: Faker::Name.name, password:'4444', mood: "serious")
us6 = User.create(username: "Tony", password:'1234', mood: emotions.sample)
us7= User.create(username: "Brad", password:'1234', mood: emotions.sample)
us8 = User.create(username: "Babs", password:'1234', mood: emotions.sample)

us1.img_url = Scraper.search(us1.username,us1.mood)
us1.save
us2.img_url = Scraper.search(us2.username,us2.mood)
us2.save
us3.img_url = Scraper.search(us3.username,us3.mood)
us3.save
us4.img_url = Scraper.search(us4.username,us4.mood)
us4.save
us5.img_url = Scraper.search(us5.username,us5.mood)
us5.save

post2 = Post.create(user: us2, content: Faker::Quote.famous_last_words)
post1 = Post.create(user: us5, content: Faker::Quote.famous_last_words)
post3 = Post.create(user: us4, content: Faker::Quote.famous_last_words)
post4 = Post.create(user: us4, content: Faker::Quote.famous_last_words)
post5 = Post.create(user: us1, content: Faker::Quote.famous_last_words)
post6 = Post.create(user: us1, content: Faker::Quote.famous_last_words)
post7 = Post.create(user: us3, content: Faker::Quote.famous_last_words)

post1.img_url = Scraper.post(post1.content)
post1.save
post2.img_url = Scraper.post(post2.content)
post2.save
post3.img_url = Scraper.post(post3.content)
post3.save
post4.img_url = Scraper.post(post4.content)
post4.save
post5.img_url = Scraper.post(post5.content)
post5.save
post6.img_url = Scraper.post(post6.content)
post6.save
post7.img_url = Scraper.post(post7.content)
post7.save

comment1 = Comment.create(user: us1, post: post1, content: Faker::Quote.famous_last_words)
comment2 = Comment.create(user: us3, post: post1, content: Faker::Quote.famous_last_words)
comment3 = Comment.create(user: us1, post: post2, content: Faker::Quote.famous_last_words)
comment4 = Comment.create(user: us3, post: post2, content: Faker::Quote.famous_last_words)
comment5 = Comment.create(user: us1, post: post3, content: Faker::Quote.famous_last_words)
comment6 = Comment.create(user: us3, post: post3, content: Faker::Quote.famous_last_words)
comment7 = Comment.create(user: us1, post: post4, content: Faker::Quote.famous_last_words)
comment8 = Comment.create(user: us3, post: post5, content: Faker::Quote.famous_last_words)
comment9 = Comment.create(user: us1, post: post6, content: Faker::Quote.famous_last_words)
comment10 = Comment.create(user: us3, post: post7, content: Faker::Quote.famous_last_words)