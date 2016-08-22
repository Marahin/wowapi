# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wowapi/version'

Gem::Specification.new do |spec|
  spec.name          = 'wowapi'
  spec.version       = Wowapi::VERSION
  spec.authors       = ['Jan Matusz']
  spec.email         = ['me@marahin.pl']
  spec.description   = %q{An easy-to-use gem providing access to World of Warcraft part of Blizzard Community API.}
  spec.summary       = %q{World of Warcraft API}
  spec.homepage      = ''
  spec.license       = 'MIT'
  spec.files 	     = Dir['Rakefile', '{bin,lib,man,test,spec}/**/*', 'README*', 'LICENSE*'] & `git ls-files -z`.split("\0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # spec.add_dependency 'engtagger'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end

