[![CI](https://github.com/brentgreeff/acts_as_human/actions/workflows/ci.yml/badge.svg)](https://github.com/brentgreeff/acts_as_human/actions/workflows/ci.yml)

# acts_as_human

Adds `full_name` / `full_name=` to an ActiveRecord model, splitting a single input into `first_name`, `middle_names`, and `last_name` with validations.

```ruby
class User < ActiveRecord::Base
  acts_as_human
end
```

## Installation

```ruby
# Gemfile
gem 'acts_as_human'
```

```bash
bundle install
rails generate acts_as_human:migration users
rake db:migrate
```

Change `users` to the name of your table.

## Usage

Assign names individually:

```ruby
user = User.new(first_name: 'Brent', last_name: 'Greeff')
user.full_name # => "Brent Greeff"
```

Or assign via a single input:

```ruby
user = User.new(full_name: 'Brent Wicked Middle Names Greeff')
user.first_name   # => "Brent"
user.middle_names # => "Wicked Middle Names"
user.last_name    # => "Greeff"
```

## Options

```ruby
acts_as_human require_last_name: false
```

## Validations

- `first_name` is required
- `last_name` is required (unless `require_last_name: false`)
- Each field is limited to 40 characters
- Non-name characters (`< > & /`) are rejected

## Development

```bash
bundle install
bundle exec lefthook install
bundle exec rspec
```

## License

MIT
