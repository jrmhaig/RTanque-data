# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rtanque/data-version'

Gem::Specification.new do |gem|
  gem.name          = "rtanque-data"
  gem.version       = RTanque::Data::VERSION
  gem.authors       = ["Joseph Haig"]
  gem.email         = ["josephhaig@gmail.com"]
  gem.summary       = %q{Create data hash from RTanque battle.}
  gem.description   = %q{Create data hash from RTanque battle.}
  gem.homepage      = "https://github.com/jrmhaig/RTanque-data"
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'rtanque', '~> 0.2.0'

  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'rspec', '~> 3.7.0'
end
