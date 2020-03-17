# Flatiron Social Network 

> A facebook inspired social network.

<h4>This project has been deployed <a href="https://flatiron-social-network.herokuapp.com">here</a>.  A walk-through of the app can be viewed <a href="https://www.youtube.com/watch?v=LinK-i-a8CU&feature=youtu.be">here</a>.</h4>

## Usage and Features
Flatiron Social Network is a place where users can share their profile, posts, and comments with other users.
<li><b>Log-In & Sign-up.</b> The app's home page allows new users to sign-up and existing users to log-in.  Password storage is hashed and salted using Bcrypt.</li>
<li><b>Create, edit and view profiles.</b> Users create their profile when signing up and can edit their profile through the settings link or on their profile page.  A index of all users is accesible via the Users link.</li>
<li><b>Create posts.</b> Once logged-in, the user is brought to the main page which shows a scrolling list of all posts in reverse-chronological order.  The main page includes a form at the top where the user can create a new post.</li>
<li><b>View posts, comments, and likes.</b>  Full post details can be viewed by clicking the Full Post button or the link in the User's profile page.  Comments and likes can be viewed and added when viewing the full post.</li>
<li><b>Webscraped Image Generation.</b>  Profile pictures and post images are generated with the Nokogiri gem by scraping Google's search function.  Profile pictures are scraped from a random selection of Google's first three image results based on the user's name and mood. Post images are scraped from a random selection of Google's first three image result based on the content of a post.</li>

## Technologies
<li>Ruby on Rails</li>
<li>Bcrypt</li>
<li>Sqlite3</li>
<li>Nokogiri</li>
<li>ActiveRecord</li>
<li>Faker</li>
<li>HTML/CSS</li>
<li>Bootstrap</li>
<li>Turbolinks</li>
<li>Webpack Dev Server</li>

## Installation
Clone the repo, start the rails server, and navigate to http://localhost:3000/
```
git clone git@github.com:elikantor/flatiron-social-network.git
cd flatiron-social-network
bundle install
rails db:create
rails db:migrate
rails db:seed
rails s
```

