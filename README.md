## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fwcontent', :git => 'https://github.com/brianfwz/fwcontent.git'
```

And then execute:

    $ bundle

    $ rails g fwcontent:install your_model

    $ rake db:migrate

## Usage

Add this line to your layout to provide content to positions. 

```ruby
= render '/get_content_for'
```
Add this line to place you want to put content.

```ruby
- if content_for? "your_position"
  = yield "your_position"
```

Login admin to create and assign content to positions on your page.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/brianfwz/fwcontent. 

