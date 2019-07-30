# App

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/app`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'app'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install app

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/app.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

# lendesk-test

install thor
ruby -v 2.6.1
exif


Make the script executable:

`chmod a+x app.rb`

`bundle exec exe/app init -d gps_images -o html`

Using Ruby, create a command line application that recursively reads all of the images from the supplied directory of images, extracts their EXIF GPS data (longitude and latitude), and then writes the name of that image and any GPS co-ordinates it finds to a CSV file.

This utility should be executable from the command line (i.e.: ‘ruby ./app.rb’ or as an executable).
With no parameters, the utility should default to scanning from the current directory. It should take an optional parameter that allows any other directory to be passed in.

As a bonus, output either CSV or HTML, based on a parameter passed in via the command line.

Feel free to use any gem(s) you like in your submission.

There is no time limit on this challenge, we want a submission that is production-level quality that you're proud of. Most candidates invest 3 - 5 hours of time on this assignment and return it within a week. Of course you are welcome to spend either more or less, and we encourage you to give us some context about your approach in your readme documentation.