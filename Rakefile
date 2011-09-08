task :default do
  sh "RAILS='~>2' bundle &&  bundle exec rspec spec"
  sh "RAILS='~>3' bundle &&  bundle exec rspec spec"
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = 'sort_alphabetical'
    gem.summary = "Sort UTF8 Strings alphabetical via Enumerable extension"
    gem.email = "michael@grosser.it"
    gem.homepage = "http://github.com/grosser/#{gem.name}"
    gem.authors = ["Michael Grosser"]
  end

  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available. Install it with: gem install jeweler"
end
