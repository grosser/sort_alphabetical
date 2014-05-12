name = "sort_alphabetical"

Gem::Specification.new name, '1.0.0' do |s|
  s.summary = 'Sort UTF8 Strings alphabetical via Enumerable extension'
  s.authors = ["Michael Grosser"]
  s.email = "michael@grosser.it"
  s.homepage = "https://github.com/grosser/#{name}"
  s.files = `git ls-files lib`.split("\n")
  s.license = "MIT"
  s.add_dependency 'unicode_utils', '>= 1.2.2'
  key = File.expand_path("~/.ssh/gem-private_key.pem")
  if File.exist?(key)
    s.signing_key = key
    s.cert_chain = ["gem-public_cert.pem"]
  end
end
