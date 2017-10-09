# ActsAsHuman

## Install
Use the Gem:

      `gem install acts_as_human`

With braid:

      `braid add git://github.com/brentgreeff/acts_as_human.git -p`


* Adds:
      full_name
* and
      full_name=
instance methods to a model

Adds validations to ensure that the names are reasonable.

* Requires:
      first_name, last_name and middle_names columns on the model

@todo Need to add rake task to add fields to model.

## Example

    class User < ActiveRecord::Base
      acts_as_human
    end

* `user = User.new(:first_name => 'Brent', :last_name => 'Greeff')`
    user.full_name
      => "Brent Greeff"

    $ user = User.new(:full_name => "Brent Wicked Middle Names Greeff")`
    user.first_name
      => "Brent"

    $ user.last_name
      => "Greeff"

    $ user.middle_names
      => "Wicked Middle Names"

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/acts_as_human.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).
