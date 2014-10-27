# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yournavigation/version'

Gem::Specification.new do |spec|
  spec.name          = 'yournavigation'
  spec.version       = Yournavigation::VERSION
  spec.authors       = ['Roman Greshny']
  spec.email         = ['greshny@gmail.com']
  spec.summary       = %q{API wrapper for http://yournavigation.org/}
  spec.description   = %q{API wrapper for http://yournavigation.org/ or YOURS project}
  spec.homepage      = 'http://www.github.com/r-ideas/yournavigation'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'httparty', '~> 0.13.1'
  spec.add_dependency 'hashie', '~> 3.3.1'
  spec.add_dependency 'activesupport'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'turn'
  spec.add_development_dependency 'pry'
end
