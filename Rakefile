task :default => :spec
require 'spec/rake/spectask'
Spec::Rake::SpecTask.new {|t| t.spec_opts = ['--color']}

begin
  project_name = 'sort_alphabetical'
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = project_name
    gem.summary = "Sort UTF8 Strings alphabetical via Enumerable extension"
    gem.email = "grosser.michael@gmail.com"
    gem.homepage = "http://github.com/grosser/#{project_name}"
    gem.authors = ["Michael Grosser"]
    gem.add_dependency "activesupport"
  end

  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end