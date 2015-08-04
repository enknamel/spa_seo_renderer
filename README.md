# Single Page App SEO Renderer

The goal of this gem is to create a rack middleware that will re-request pages that come from a webcrawler and render them using a headless webkit driver (Capybara Webkit) 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'spa_seo_renderer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spa_seo_renderer

## Usage

Built for rails to work out of the box
 
The only caveat is that rails has a rack mutex that will block multiple request from being processed (which means this will hang until it hits a timeout) unless you set
```ruby
config.allow_concurrency = true
```

And you do not use WEBrick (which rails will enforce using the mutux if you do use). Thin, Puma, Nginx, Apache, etc work fine. 

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/enknamel/spa_seo_renderer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
