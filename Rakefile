desc "Run all specs in spec directory"
task :default do |t|
  options = "--colour --format progress --loadby --reverse"
  files = FileList['spec/**/*_spec.rb']
  system("spec #{options} #{files}") rescue nil
  system("ACTIVE_SUPPORT_VERSION='2.1.1' spec #{options} #{files}")
end

begin
  project_name = 'sort_alphabetical'
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = project_name
    gem.summary = "Ruby: sort UTF8 Strings alphabetical via Enumerable extension"
    gem.email = "grosser.michael@gmail.com"
    gem.homepage = "http://github.com/grosser/#{project_name}"
    gem.authors = ["Michael Grosser"]
    gem.add_dependency "activesupport"
  end
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end