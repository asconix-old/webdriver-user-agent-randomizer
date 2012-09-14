# Webdriver::User::Agent

A helper gem to emulate random generated web browser user agents when using webdriver. The pool contains currently
9.057 different user agents (September 2012).

Many thanks to Alister Scott (http://github.com/alisterscott) for his *webdriver-user-agent* gem
(https://github.com/alisterscott/webdriver-user-agent) which I have taken as basis for this generator.

## Installation

Add this line to your application's Gemfile:

    gem 'webdriver-user-agent-randomizer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install webdriver-user-agent-randomizer

## Usage

The gem provides a UserAgent.driver method to return a new webdriver with a random user agent.

### Options

* :browser
	* :firefox (default)
	* :chrome

### Example using selenium-webdriver

	require 'selenium-webdriver'
	require 'webdriver-user-agent-randomizer'
	driver = UserAgent.driver(:browser => :chrome)
	driver.get 'http://www.example.com'

### Example using watir-webdriver

	require 'watir-webdriver'
	require 'webdriver-user-agent-randomizer'
	driver = UserAgent.driver(:browser => :chrome)
	browser = Watir::Browser.new driver
	browser.goto 'example.com'

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
