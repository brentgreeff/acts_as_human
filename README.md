[![Build Status](https://semaphoreci.com/api/v1/brentgreeff/acts_as_human/branches/master/badge.svg)](https://semaphoreci.com/brentgreeff/acts_as_human)

# ActsAsHuman

    class User < ActiveRecord::Base
      # t.string "first_name"
      # t.string "middle_names"
      # t.string "last_name"
      
      acts_as_human
    end

Supplying first and last names separately:    
    `user = User.new(first_name: 'Brent', last_name: 'Greeff')`
    
You can then read the full_name

    user.full_name
      => "Brent Greeff"

Supplying a full_name:    
    `user = User.new(full_name: "Brent Wicked Middle Names Greeff")`
    
You can then read the individual names:

    user.first_name
      => "Brent"

    user.last_name
      => "Greeff"

    user.middle_names
      => "Wicked Middle Names"


Enable users to provide their full name in a single text input.
Saves to 3 separate fields:
first_name, middle_names and last_name allowing you to easily display their name
in different formats in different places.

Validations limit each name field to 40 characters each, allowing a total length of 120 characters for the full name.
Non-name like characters are invalid.

## Bundler

    gem acts_as_human

* Adds `full_name` and `full_name=` instance methods to a model.

Adds validations to ensure that the names are reasonable.

* Requires:
      first_name, last_name and middle_names columns in the database.

## Migration

    bundle exec acts_as_human migration users

Change "users" to the name of your existing table.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/acts_as_human.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).
