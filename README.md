# CurrencyConverter

Small utility gem that can do currency conversion using exchange rates from https://open.er-api.com/v6/latest

## Usage

```ruby

# Convert 100 USD to EUR
CurrencyConverter.convert("USD", 100, "EUR")
# => 90

# Convert 100 USD to JPY
CurrencyConverter.convert("USD", 100, "JPY")
# => 11000
```

### Invalid conversions

```ruby
CurrencyConverter.convert("USD", nil, "JPY")
# => CurrencyConverter::Error: {:amount=>["must be filled"]}

CurrencyConverter.convert("USD", 100, 'INVALID')
# => CurrencyConverter::ConversionRateNotFound: Conversion rate for 'INVALID' not found
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CurrencyConverter project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/siklodi-mariusz/currency_converter/blob/main/CODE_OF_CONDUCT.md).
