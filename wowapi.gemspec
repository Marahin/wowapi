# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wowapi/version'

Gem::Specification.new do |spec|
  spec.name                   = 'wowapi'
  spec.version                = Wowapi::VERSION
  spec.required_ruby_version  = '>= 2.0.0'
  spec.authors                = ['Jan Matusz']
  spec.email                  = ['me@marahin.pl']
  spec.description            = %q{An easy-to-use gem providing access to World of Warcraft part of Blizzard Community API.}
  spec.summary                = %q{World of Warcraft API}
  spec.homepage               = 'https://git.3lab.re/marahin/wowapi'
  spec.license                = 'MIT'
  spec.files 	                = `git ls-files -z`.split("\x0")
  spec.executables            = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files             = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths          = ['lib']

  if spec.respond_to?(:add_development_dependency)
    spec.add_development_dependency 'pry', '~> 0.10'
  end
end

