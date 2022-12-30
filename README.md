# Htmltokit

A ruby gem converts HTML to PDF, JPEG and PNG with [ferrum](https://github.com/rubycdp/ferrum)

⚠️ It's still in the very early stage.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add htmltokit

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install htmltokit

Install [Chrome](https://www.google.com/chrome/) or [Chromium](https://www.chromium.org/getting-involved/download-chromium)

## Usage

```ruby
html_to_kit = HtmlToKit.new('https://example.com')
html_to_kit = HtmlToKit.new('<html><body><h1>Hello World!</h1></body></html>')
html_to_kit = HtmlToKit.new(a_html_file)

html_to_kit.to_image('example.png')
html_to_kit.to_image('example.jpg')

html_to_kit.to_pdf
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/htmltokit/htmltokit. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/htmltokit/htmltokit/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Htmltokit project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/htmltokit/htmltokit/blob/main/CODE_OF_CONDUCT.md).
