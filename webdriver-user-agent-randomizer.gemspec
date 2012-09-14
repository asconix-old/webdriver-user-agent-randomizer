# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.authors       = ["Christoph Pilka"]
  gem.email         = ["c.pilka@asconix.com"]
  gem.description   = %q{A helper gem to emulate random generated web browser user agents when using webdriver}
  gem.summary       = %q{A helper gem to emulate random generated web browser user agents when using webdriver}
  gem.homepage      = "http://github.com/asconix/webdriver-user-agent-randomizer"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "webdriver-user-agent-randomizer"
  gem.require_paths = ["lib"]
  gem.version       = "0.0.1"
  gem.add_dependency 'selenium-webdriver'
  gem.add_dependency 'facets'
  gem.add_dependency 'json'
  gem.add_dependency 'nokogiri'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'watir-webdriver'
end
