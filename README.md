## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fwcontent'
```
AND 

```ruby
gem 'enumerize'
```

And then execute:

    $ bundle

## Usage

Add this line to provide content to your position. 

```ruby
= render '/get_content_for'
```

```ruby
- if content_for? "your_position"
        = yield "your_position"
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/fwcontent. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

