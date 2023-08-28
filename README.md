## Portabilis
This is the repository for the code challenge proposed for the Ruby on Rails developer position.

### Dependencies
* Ruby (3.2.2)
* Rails (7.0.7)
* PostgreSQL
* Devise
* Pundit
* RSpec

### Configuration
To run the project you just need to clone it, install the dependencies with `bundle install` and run the server with `rails s` or `./bin/dev`

### Database creation
For the database you will need to have PostgreSQL already installed.
Just run `rake db:create db:migrate db:seed` and you should be good to go.

### How to run the test suite
To run the test suite you just need to have your database running, then execute the following command `bundle exec rspec`

### API
You can find the API documentation on this [LINK](https://documenter.getpostman.com/view/16986903/2s9Y5Zu28W), it has all the examples for the usage of the API.

## Considerations
- I've trying to learn to use Tailwind and Hotwire, tried to use on this project but failed miserably, ended with a very basic frontend.
- I did the entire project in english because is the language I'm used to use when I code, but I have no problem on doing it in pt-BR.
