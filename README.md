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