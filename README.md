# Everlasting [![Build Status](https://travis-ci.org/koic/everlasting.svg)](https://travis-ci.org/koic/everlasting) [![Gem Version](https://badge.fury.io/rb/everlasting.svg)](http://badge.fury.io/rb/everlasting)

Enhance the behavior of Hash in the behavior of ActionController::Parameters.

ActionController::Parameters does not inherit Hash since Rails 5.0. This Gem will never cause an error even if you call Hash's method on ActionController::Parameters.

The aim of this Gem is to detect a Hash method calls to ActionController::Parameters without causing errors.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'everlasting'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install everlasting

## Support version

- Ruby 2.2.2 or higher.
- Rails 5 or higher.

## About behavior

It is a comparison of behavior when using this Gem and when not using it.

### Plain Rails 5 application (Without this Gem)

```ruby
params.symbolize_keys # => NoMethodError: undefined method `symbolize_keys' for #<ActionController::Parameters:0x00007ffd92632f30>
```

### Rails 5 application with this Gem

```ruby
params.symbolize_keys # => It outputs exception information to Rails.logger.error without error
```

It will output to the Rails log together with the backtrace as follows.

```console
The Everlasting Gem detected a method that ActionController::Parameters does not know.
ActionController::Parameters does not inherit Hash since Rails 5.0.
Use `params.to_h.symbolize_keys' instead of `params.symbolize_keys'.

---backtrace---

(snip)

bin/rails:8:in `require'
bin/rails:8:in `<main>'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/koic/everlasting.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
