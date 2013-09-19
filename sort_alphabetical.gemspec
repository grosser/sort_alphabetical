# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = 'sort_alphabetical'
  s.version = '0.1.4'
  s.required_ruby_version = '>= 1.9.0'

  s.authors = ['Michael Grosser']
  s.date = '2013-09-19'
  s.email = 'michael@grosser.it'
  s.files = Dir.glob('**/*')
  s.homepage = 'http://github.com/grosser/sort_alphabetical'
  s.require_paths = ['lib']

  s.summary = 'Sort UTF8 Strings alphabetical via Enumerable extension'

  s.add_dependency 'activesupport', '>= 3.0.0'
  s.add_development_dependency 'rspec', '>= 2.0.0'
end

