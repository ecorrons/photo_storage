##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [2.7.2p137]
- Rails [6.0.3.6]
- psql (PostgreSQL) 12.6

##### 1. Check out the repository

```bash
git clone git@github.com:ecorrons/photo_storage.git
```
##### 2. Create application.yml file

Copy the sample application.yml file and edit the values as your needed.

```bash
cp config/application.yml.example config/application.yml
```

##### 3. Create and migrate the database

Run the following commands to create and migrate the database.

```ruby
bundle exec rake db:create
bundle exec rake db:migrate
```

##### 4. Define TTL

TTL of cached images is defined in app/models/image.rb. Change it as you wish as long as you 
are aware it has to be an ActiveSupport::Duration instance.


##### 5. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL: http://localhost:3000/images

This app creates an Image Gallery Search API. It consumes image data from an external API and provides 2 endpoints:
GET /images : Returns all cached images. First hit and the one after cache expiration may take a while, please be patient.

GET /search/:searchTerm : Searches given term among cached images. Meta fields considered are: Author, Camera and Tags. For example, try: GET /search/Canon or GET /search/nature