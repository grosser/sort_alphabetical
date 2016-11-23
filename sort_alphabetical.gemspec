name = "sort_alphabetical"

Gem::Specification.new name, '1.1.0' do |s|
  s.summary = 'Sort UTF8 Strings alphabetical via Enumerable extension'
  s.authors = ["Michael Grosser"]
  s.email = "michael@grosser.it"
  s.homepage = "https://github.com/grosser/#{name}"
  s.files = `git ls-files lib Readme.md`.split("\n")
  s.license = "MIT"
  s.add_dependency 'unicode_utils', '>= 1.2.2'
  s.required_ruby_version = '>= 2.0.0'
end
