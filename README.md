# Central Oregon COAD

This is the GitHub repository for the Central Oregon Community Organizations Active
in Disaster (COAD) help service system. It connects people in need with resources
made available by members of Community Organizations Active in Disaster.

## Development

Fork and then Clone the repository:

```
git clone https://github.com/kunaljhatta/cs362-coad-resources
```

This is a Rails application that uses SQLite in development and PostgreSQL in production.

From the project direcotry, install the dependencies:

```
gem install bundler
bundle install
```
Copy the .env.example file to .env, and add admin/test email and password.

To copy the file: 

```
cp .env.example .env
```
Change the following fields: 
```
DEFAULT_PASSWORD='CHANGEME'
ADMINS='{admin_name: "changeme@changeme.com" }'
TEST_USER_EMAIL='changeme@changeme.com'
TEST_USER_PASSWORD='CHANGEME`
```

Next, set up the database:

```
rails db:setup
```
There is no need to run next command.

```
rails db:seed
```
Reason is the rails db:setup will implicitly 
runs seed. 

Start the app:

```
rails server
```

## Testing

This project uses RSpec for testing.

```
rspec
```

You can also run a specific directory of tests or file by supplying its name, like so:

```
spring rspec spec/path/to/file_spec.rb
```

## Deployment

This application uses [heroku for deployment](https://devcenter.heroku.com/articles/git).
Some useful commands to know can be found below.

Set up a heroku app to deploy to:

```
heroku git:remote -a coad-resources-staging
heroku git:remote -a coad-resources

```

Rename them _staging_ and _production_:

```
git remote rename coad-resources-staging staging
git remote rename coad-resources production

```

Deploy to a heroku app:

```
git push staging
```

Migrate the rails database of a heroku app:

```
heroku run rails db:migrate --remote staging
```

Seed the rails database of a heroku app:

```
heroku run rails db:seed --remote staging
```

Set environment variables (see _.env.example_ for expectations):

```
heroku config:set FOO=bar
```

## Production Dependencies

PostgreSQL
Email Server (Gmail)
Recaptcha

## Data model
![erd](public/documentation/erd.jpg?raw=true)


&copy; 2022 Kunal Jhatta, Paul Koos, Erin Szabo. All rights reserved.
